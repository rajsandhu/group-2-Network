terraform {
  backend "s3" {
    bucket = "group-2-elk-4073724601872"
    region = "eu-central-1"
    key    = "group2-elk/vpc/terraform.tfstate"
    dynamodb_table = "terraform-lock"
  }
}