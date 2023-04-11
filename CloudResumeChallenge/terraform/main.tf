terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.62.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "terraform" 
    
  }

  resource "aws_s3_bucket" "website_files" {
  bucket = "my-cloud-resume-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Test"
  }
}

resource "aws_s3_object" "object" {
  bucket = "my-cloud-resume-bucket"
  for_each = fileset("C:\\Users\\tzsha\\Desktop\\VSCode\\My Resume", "*")
  key    = each.value
  source = "C:\\Users\\tzsha\\Desktop\\VSCode\\My Resume\\${each.value}"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("C:\\Users\\tzsha\\Desktop\\VSCode\\My Resume\\${each.value}")
}
