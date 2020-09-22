# Create a new instance of the latest Ubuntu 20.04LTS on an
# t3.micro node with an AWS Tag naming it var.tag
locals {
  env = var.env
}

resource "aws_vpc" "appli_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {Name = "VPC Terraform ${local.env}"}
}

resource "aws_subnet" "appli_subnet" {
  vpc_id                  = aws_vpc.appli_vpc.id
  map_public_ip_on_launch = true
  tags                    = { Name = "subnet-${local.env}" }
  cidr_block              = "10.0.1.0/24"
}

resource "aws_instance" "appli_instances" {
  for_each                    = var.my_instances
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.appli_subnet.id
  associate_public_ip_address = true
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 8
    volume_type = "standard"
  }
  iam_instance_profile = "AdminAccess"
  user_data            = "apt-get upgrade; apt-get update; apt-get install -y vim; mkdir ~/test"
  tags = {
    Name = "${each.value.tag} ${local.env}"
  }

  //vpc_security_group_ids = []
  key_name = "default_ec2"

}