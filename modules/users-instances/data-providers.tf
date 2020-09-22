data "aws_region" "current" {}

/*data "aws_ami_ids" "aws_linux_2_latest_ids" {
  owners = ["amazon"]
}*/

#data.aws_ami.ubuntu
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu-*-18*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}

data "aws_availability_zones" "az_available" {
  state = "available"
}
