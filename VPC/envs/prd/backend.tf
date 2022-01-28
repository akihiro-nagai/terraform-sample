terraform {
  backend "s3" {
    bucket = "mau-various"
    key    = "terraform/tfstate/prd/vpc.tfstate"
    region = "us-west-2"
  }
}
