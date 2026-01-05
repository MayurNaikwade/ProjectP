terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Remote state (best practice for production ready infrastructure)
  # backend "s3" {
  #   bucket         = "TF_STATE_BUCKET_NAME"
  #   key            = "projectp/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "TF_LOCK_TABLE"
  #   encrypt        = true
  # }
}
