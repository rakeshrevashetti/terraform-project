variable "vpc_id_to_use_for_other_modules" {
  description = "Takes value from vpc_module"
}
variable "alb_sg_name" {
  description = "The name of the security group"
}

variable "my_load_balancer_type" {
  description = "value of the load balancer type"  
}

variable "my_alb_name" {
  description = "The name of the Application Load Balancer"  
}

variable "targets" {
  description = "The list of targets to register with the target group"
}

variable "my_target_group_name" {
  description = "The name of the target group"
}

variable "public_subnets_IDs_for_reference" {
  description = "take values from aws_vpc_module"
  type = list(string)
}
