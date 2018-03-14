# terraform {
#   required_version = ">= 0.11.0"
#   backend "s3" {
#     bucket         = "cc-dev-terraform-state"
#     key            = "cc_dev/cps-uat/terraform.tfstate"
#     region         = "us-west-2"
#     dynamodb_table = "terraform_locks"
#     encrypt        = true
#   }
# }

