terraform {
  backend "s3" {
    bucket = "terraform-two-tier-dev-state-123456"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}
