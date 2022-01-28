locals {
  env_name = "prd"
}

module "main_vpc" {
  source                     = "../../modules/main-vpc"
  name                       = "test-vpc-${local.env_name}"
  vpc_cidr_block             = "10.2.0.0/16"
  public_subnet_cidr_block_a = "10.2.1.0/24"
}
