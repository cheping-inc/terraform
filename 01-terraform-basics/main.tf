provider "aws" {
	region = "us-east-1"
	version = "~> 3.6.0"
}

# plan - execute 
resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-s3-bucket-rodart-001"
	versioning {
		enabled = true
	}
}

resource "aws_iam_user" "my_iam_user" {
	name "rodart2"
}

output "my_bucket_details" {
	value = aws_s3_bucket.my_s3_bucket
}

output "my_iam_user_details" {
	value = aws_iam_user.my_iam_user
}