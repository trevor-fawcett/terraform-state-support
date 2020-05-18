# Terraform State Storage and Locking

Provides a S3 bucket for storage of state and DynamoDB table for locking.

## Usage

In solutions that will utilise the stroage and locking facility, add the following `backend.tf` along with solution's Terraform and modify the `project-name` as appropriate. Note: Terraform state facilities are in `eu-west-2`.

```terraform
terraform {
  backend "s3" {
    key            = "{project-name}/terraform.tfstate"
    region         = "eu-west-2"
    bucket         = "awip-terraform-state-storage"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}
```

## Note

If you stumble across this repo and want to store Terraform State in this manner, all you'll need to do is adjust the region (to your preferred region) and S3 bucket name (must be gloablly unique).

If using this repo as is, to set up S3 and DynamoDB, you'll need to comment out or remove `backend.tf` for the initial `terraform apply`, before reinstating and applying once more to move state to S3 and utilise DynamoDB for locking.