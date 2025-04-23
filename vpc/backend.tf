terraform {
  required_version = ">= 1.11.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "spoon-terraform-0421"
    key    = "spoon-terraform.tfstate"
    region = "ap-northeast-2"
  }
}
