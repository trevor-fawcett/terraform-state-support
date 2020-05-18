terraform {
  backend "s3" {
    key            = "backend/terraform.tfstate"
    region         = "eu-west-2"
    bucket         = "awip-terraform-state-storage"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}