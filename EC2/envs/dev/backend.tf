terraform {
  backend "s3" {
    bucket = "mau-various"
    key    = "terraform/tfstate/dev/ec2.tfstate"
    region = "us-west-2"
  }
}
