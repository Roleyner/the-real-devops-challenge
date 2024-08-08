module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.10.0"

  name               = "app-alb"
  load_balancer_type = "application"
  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.public_subnets

  security_groups = [module.lb_sg.security_group_id]

  listeners = {
    http = {
      port     = 80
      protocol = "HTTP"
      forward = {
        target_group_key = "app-tg"
      }
    }
  }

  target_groups = {
    app-tg = {
      name_prefix = "app-tg"
      protocol    = "HTTP"
      port        = 80
      target_type = "instance"
      target_id   = "i-0f6d38a07d50d080f"
      health_check = {
        path                = "/"
        protocol            = "HTTP"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 5
        unhealthy_threshold = 2
      }
    }
  }

  tags = {
    Name = "app-alb"
  }
}
