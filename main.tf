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
   ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServer"
  }
}
