pipeline {
    agent any
    tools {
       terraform 'my-terraform'
    }
    stages {
        stage('Git checkout') {
           steps{
                git branch: 'main', url: 'https://github.com/nasinghn/terraform_lab.git'
            }
        }
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('Backend-Plan') {
            steps{
        // Create Terraform plan for backend resources
        withCredentials([string(credentialsId: 'AWS_ACCESS_KEY', variable: 'aws_access_key'), 
                        string(credentialsId: 'AWS_SECRET_KEY', variable: 'aws_secret_key')]) {
                sh 'terraform plan \
                        -out backend.tfplan \
                        -var="aws_access_key=$aws_access_key" \
                        -var="aws_secret_key=$aws_secret_key"'
                        }
            }
        }
        stage('Backend-Apply') {
            steps{
        withCredentials([string(credentialsId: 'AWS_ACCESS_KEY', variable: 'aws_access_key'), 
                        string(credentialsId: 'AWS_SECRET_KEY', variable: 'aws_secret_key')]) {
                sh 'terraform apply backend.tfplan'
                            }
        }
    }
        stage('Destroy'){
            steps{
        input 'Destroy?'
        withCredentials([string(credentialsId: 'AWS_ACCESS_KEY', variable: 'aws_access_key'), 
                        string(credentialsId: 'AWS_SECRET_KEY', variable: 'aws_secret_key')]) {
                sh 'terraform destroy \
                        -auto-approve \
                        -var="aws_access_key=$aws_access_key" \
                        -var="aws_secret_key=$aws_secret_key"'
                }
            }
        }
}
}
    