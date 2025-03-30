resource "aws_security_group" "alb_sg" {
    name = "alb_security_group"
    vpc_id = var.vpc_id_to_use_for_other_modules
    description = "Used in the DevOps project and allow traffic on port 80 and port 22"
    tags = {
        Name = var.alb_sg_name
    }

    ingress  {
        from_port = 22
        to_port = 22
        protocol = "tcp"   
        cidr_blocks = ["0.0.0.0/0"] 
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"    
        cidr_blocks = ["0.0.0.0/0"] 
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1" 
        cidr_blocks = ["0.0.0.0/0"] 
    }
  
}

resource "aws_lb" "devops_alb" {
    load_balancer_type = var.my_load_balancer_type
    name = var.my_alb_name
    internal = false
    security_groups = [aws_security_group.alb_sg.id]
    subnets = var.public_subnets_IDs_for_reference
    enable_deletion_protection = false
    idle_timeout = 400
    tags = {
        Name = var.my_alb_name
    }
}

resource "aws_lb_target_group" "devops_target_group" {
    name = var.my_target_group_name
    port = 80
    protocol = "HTTP"
    target_type = var.targets
    vpc_id = var.vpc_id_to_use_for_other_modules
    health_check {
        path = "/"
        port = 80
        protocol = "HTTP"
        timeout = 5
        interval = 30
        healthy_threshold = 2
        unhealthy_threshold = 2
    }

    tags = {
        Name = var.my_target_group_name
    }
}

resource "aws_lb_listener" "devops_listener" {
    load_balancer_arn = aws_lb.devops_alb.arn
    port = "80"
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.devops_target_group.arn
    }
}
