terraform {
  required_providers {
    aws ={
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
  backend "s3" {
    #backend configuration is passed based on environment (dev,prod)
  }
}