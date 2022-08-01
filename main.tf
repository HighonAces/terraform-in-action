provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "hello-world" {
  ami = "ami-0b0950360cb811cfc"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}