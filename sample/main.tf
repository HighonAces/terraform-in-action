terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2_server" {
  ami = "ami-04682597beff929bd"
  instance_type = "t2-micro"
  key_name = "raspberry_key"
}

resource "aws_key_pair" "raspebrry" {
  key_name = "raspberry_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDeGNwDUtFELDscIZwlWXCnpKw/5t5BR/1FL/T6Ivj8/syHSOSMAe4iERqZVXzEZcpTiUVVL3Nf92a2Q7gh7xO3hdcKSbAvGG9sehuXqyp797v9lb5PJR61w2PZ3HO5tAvi20ApXDGwMeZhU+K0OGlZtSUVl5VcI6Ay2dKkT0TVqXxGmODFMsnt6EFFiDvOvdRrB+r8G877ffT1ANMAvm9y7wp+Jg9fGqGp9XIQRFvugFnn4Bj+RIa0d81Vd+KbzENvBnIbTn2fOaEmax3BdY27AWDyDP4GNGRQ4ZuojuK0RDo31xbtjEiCEskYyMJ1l9UPoVtG1lHymBNfzQqPLkgi8HWpPMb/ueY5E+4ENTEl8FS+qBk5zT8+CAxB/w09KLz3eUJgGjiM7p1eWBYQrDuzhYumytMGDB/31aMHeEf62vVLVX6+hDXCYg2K3LOldd0WC8jp/84Qq3S76B2CqaOqaJ32/v9NxbaXXh6pSQ4wqDL2FQEu/RVk6uNMDm14N/k= ubuntu@ubuntu"
}

output "ec2-dns-name" {
  value = aws_instance.ec2_server.public_dns
}