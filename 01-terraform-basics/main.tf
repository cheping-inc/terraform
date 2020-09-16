provider "aws" {
	region = "us-east-1"
	version = "~> 3.6.0"
}

# plan - execute 
resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-s3-bucket-rodart-001"
}
