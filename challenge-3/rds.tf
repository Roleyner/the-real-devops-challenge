module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.8.0"

  identifier = "appdb"

  major_engine_version   = "5.7"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = var.db_instance_class
  allocated_storage      = 20
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  port                   = "3306"
  vpc_security_group_ids = [module.rds_sg.security_group_id]
  subnet_ids             = module.vpc.private_subnets

  create_db_subnet_group = true
  family                 = "mysql5.7"

  monitoring_interval    = 30
  create_monitoring_role = true

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]
}
