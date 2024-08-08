module "lb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.8.0"

  name        = "lb-sg"
  description = "Allow HTTP traffic to the load balancer"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = {
    Name = "lb-sg"
  }
}

module "rds_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.8.0"

  name        = "rds-sg"
  description = "Allow MySQL traffic to RDS"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = "10.0.0.0/16"
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = {
    Name = "rds-sg"
  }
}
