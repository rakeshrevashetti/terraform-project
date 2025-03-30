variable "vpc_id_to_use_for_other_modules" {
  description = "we will manually enter it, after taking it from aws_vpc_module"
}

variable "my_asg_name" {
  description = "Enter the asg name"
}


variable "private_subnets_IDs_for_ASG" {
    description = "Take value from root main.tf"
    type = list(string)
}

variable "public_subnets_IDs_for_reference" {
    description = "take values from root main.tf"
    
}
variable "my_sg_name" {
  description = "The name of the security group"
}

variable "base_ami_id" {
  description = "The base AMI ID to use for the EC2 instances"
}

variable "instance_type_for_custom_ami" {
  description = "The instance type to use for the EC2 instances"
}

variable "instance_type_for_lt" {
  description = "The instance type to use for the EC2 instances"
  
}
variable "my_key" {
  description = "The name of the private key to use for the EC2 instances"
  
}
variable "desired" {
    description = "Enter desired instances"
}

variable "maximum" {
    description = "Enter maximum instances"
}

variable "minimum" {
    description = "Enter minimum instances"
}

variable "devops_target_group_arn" {
  description = "take value from aws_lb_module"
}
