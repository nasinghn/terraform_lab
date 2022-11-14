provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}
resource "aws_s3_bucket" "tf_course" {
  bucket = "nasinghn-test-bucket"
#  acl = "private"
}
resource "aws_instance" "test_instance" {
   ami           = "ami-0603cbe34fd08cb81"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServer"
  }
}
