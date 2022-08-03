terraform {
  backend "s3" {
    bucket = "s3backend-hsusdryfhjhm0f-state-bucket"
    key = "jesse/james"
    region = "us-west-2"
    encrypt = true
    role_arn = "arn:aws:iam::473189215807:role/s3backend-hsusdryfhjhm0f-tf-assume-role"
    dynamodb_table = "s3backend-hsusdryfhjhm0f-state-lock"
  }
  required_version = ">= 0.15"
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

resource "null_resource" "motto" {
  triggers = {
    always = timestamp()
  }
  provisioner "local-exec" {
    command = "echo gotta catch em all"
  }
}