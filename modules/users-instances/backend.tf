

terraform {
    backend "s3" {
        bucket = "dev-appli-01-backend-state"
        key = "users-instances.tfstate"
        region = "us-east-1"
        dynamodb_table = "dev-appli-01-users-instances-locks"
        encrypt = true
    }
}

/*terraform {
    backend "s3" {
        bucket = "${var.environment}-${var.application}-backend-state"
        key = "${var.project}.tfstate"
        region = data.aws_region.current
        dynamodb_table = "${var.environment}-${var.application}-${var.project}-locks"
        encrypt = true
    }
}
*/
