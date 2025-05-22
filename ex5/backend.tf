terraform {
  backend "s3" {
    bucket = "terraformstate98"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}