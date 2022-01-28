locals {
  env_name = "dev"
}

module "main_vpc" {
  source                     = "../../modules/main-vpc"
  name                       = "test-vpc-${local.env_name}"
  vpc_cidr_block             = "10.1.0.0/16"
  public_subnet_cidr_block_a = "10.1.1.0/24"
}
