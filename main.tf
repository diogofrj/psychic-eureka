terraform {
  # backend "remote" {
  #   hostname = "app.terraform.io"
  #   organization = "diogolabs"
  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }
  cloud { 
    
    organization = "diogolabs" 

    workspaces { 
      name = "terra-house-1" 
    } 
  } 
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "aws" {
  region = "us-east-1"
}

resource "random_string" "random_string" {
  length = 16
  special = true
  upper = false
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "dfs-s3-bucket-${replace(random_string.random_string.result, "/[^a-z0-9-_.]/", "")}"
}



