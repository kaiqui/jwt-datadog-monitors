terraform {
  backend "s3" {
    bucket = "jwt-bucket-terraform-state"
    key    = "jwt-datadog-monitors/terraform.tfstate"
    region = "sa-east-1"
  }
}
