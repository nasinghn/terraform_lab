provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}
resource "aws_s3_bucket" "tf_course" {
  bucket = "nasinghn-testing-bucket2023"
#  acl = "private"
}
resource "aws_instance" "test_instance" {
   ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.nano"

  tags = {
    Name = "Terraform-Cloud-example"
  }
}
