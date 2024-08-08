module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "7.7.0"

  name = "app-asg"

  min_size            = 1
  max_size            = 3
  desired_capacity    = 1
  vpc_zone_identifier = module.vpc.private_subnets

  launch_template_name        = "app-launch-template"
  launch_template_description = "Launch template for app instances"
  update_default_version      = true

  image_id      = var.ami_id
  instance_type = var.instance_type

  create_iam_instance_profile = true
  iam_role_name               = "app-asg-role"
  iam_role_path               = "/ec2/"
  iam_role_description        = "IAM role for app instances"

  tags = {
    Name        = "app-instance"
    Environment = "dev"
  }

  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                echo "It works!" > /var/www/html/index.html
                systemctl start httpd
                systemctl enable httpd
              EOF
}