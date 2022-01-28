resource "aws_instance" "bastion" {
  ami           = "ami-06cffe063efe892ad"
  instance_type = "t2.micro"

  tags = {
    Name = var.name
  }

  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  key_name                    = var.keypair_name

  vpc_security_group_ids = [
    aws_security_group.bastion_sg.id,
  ]
}

resource "aws_security_group" "bastion_sg" {
  name        = "${var.name}-sg"
  description = "bastion sg for ${var.name}"

  vpc_id = var.vpc_id
  ingress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
  ]

  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    },
  ]


}
