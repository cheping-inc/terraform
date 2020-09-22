

resource "aws_ebs_volume" "appli_ebs" {
  availability_zone = data.aws_availability_zones.az_available.names[0]
  size              = 10

  tags = {
    Name = "EBS Terraform ${local.env}"
  }
}
