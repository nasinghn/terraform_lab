provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_s3_bucket" "tf_course" {
  bucket = "nasinghn-test-bucket"
#  acl = "private"
}
resource "aws_instance" "test_instance" {
   ami           = "ami-0603cbe34fd08cb81"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

output "app_server" {
  value = "${aws_instance.app_server.public_ip}"
}
