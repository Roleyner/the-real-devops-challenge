aws_region        = "us-west-2"
vpc_cidr          = "10.0.0.0/16"
public_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets   = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
db_name           = "appdb"
db_username       = "admin"
db_password       = "yourpassword"
db_instance_class = "db.t2.micro"
ami_id            = "ami-0c55b159cbfafe1f0"
instance_type     = "t2.micro"
