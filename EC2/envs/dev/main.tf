locals {
  env_name = "dev"
}

# note: いわゆるクロススタック参照的なもの
data "aws_vpc" "main_vpc" {
  id = "vpc-010e802244a5359c2"
}
data "aws_subnet" "main_vpc_public_subnet" {
  id = "subnet-0eb5ea11aaab9ce98"
}

module "ec2-bastion" {
  source = "../../modules/ec2-bastion"

  name         = "bastion-${local.env_name}"
  vpc_id       = data.aws_vpc.main_vpc.id
  subnet_id    = data.aws_subnet.main_vpc_public_subnet.id
  keypair_name = "ssh-keypair"
}
