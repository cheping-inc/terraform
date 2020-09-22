//S3 bucket
resource "aws_s3_bucket" "appli_backend_state" {
  bucket = "${var.environment}-${var.application}-backend-state"

  lifecycle {
    prevent_destroy = false
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

//Locking - Dynamo DB
resource "aws_dynamodb_table" "appli_backend_lock" {
  name         = "${var.environment}-${var.application}-${var.project}-locks"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}