terraform {
  backend "s3" {
    bucket = "mau-various"
    key    = "terraform/tfstate/dev/vpc.tfstate"
    region = "us-west-2"
  }
}
