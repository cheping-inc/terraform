provider "aws" {
	regions = "us-east-1"
	version = "~> 3.6.0"
}

# plan - execute 
resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "mya-s3-bucket-rodart-001"
}
