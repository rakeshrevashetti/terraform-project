provider "aws" {
    region = var.my_region
}


module "aws_vpc_module" {
    source = "./modules/aws_vpc_module"
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    subnet1_cidr = var.subnet1_cidr
    subnet2_cidr = var.subnet2_cidr
    subnet3_cidr = var.subnet3_cidr
    subnet4_cidr = var.subnet4_cidr
    my_az_region1 = var.my_az_region1
    my_az_region2 = var.my_az_region2
    my_igw = var.my_igw
    natgw_name = var.natgw_name
    public_subnet1_name = var.public_subnet1_name
    public_subnet2_name = var.public_subnet2_name
    public_route_table_name = var.public_route_table_name
    private_subnet1_name = var.private_subnet1_name
    private_subnet2_name = var.private_subnet2_name
    private_route_table_name = var.private_route_table_name
}

module "aws_lb_module" {
    source = "./modules/aws_lb_module"
    vpc_id_to_use_for_other_modules = module.aws_vpc_module.vpc_id_to_use_for_other_modules
    alb_sg_name = var.alb_sg_name
    my_load_balancer_type = var.my_load_balancer_type
    my_alb_name = var.my_alb_name
    targets = var.targets
    my_target_group_name = var.my_target_group_name
    public_subnets_IDs_for_reference = module.aws_vpc_module.public_subnets_IDs_for_reference

}

module "aws_autoscaling_group" {
    source = "./modules/aws_auto_scaling_group_module"
    vpc_id_to_use_for_other_modules = module.aws_vpc_module.vpc_id_to_use_for_other_modules
    my_sg_name = var.my_sg_name
    my_asg_name = var.my_asg_name
    base_ami_id = var.base_ami_id
    instance_type_for_custom_ami = var.instance_type_for_custom_ami
    instance_type_for_lt = var.instance_type_for_lt
    my_key = var.my_key
    desired = var.desired
    maximum = var.maximum
    minimum = var.minimum
    public_subnets_IDs_for_reference = module.aws_vpc_module.public_subnets_IDs_for_reference[0]
    private_subnets_IDs_for_ASG = module.aws_vpc_module.private_subnets_IDs_for_ASG
    devops_target_group_arn = module.aws_lb_module.devops_target_group_arn
}

module "aws_Iam_Ec2_s3_module" {
    source = "./modules/aws_Iam_Ec2_s3_module"
    bucket_name      = var.bucket_name
    my_iam_role      = var.my_iam_role
    my_ami           = var.my_ami
    my_instance_type = var.my_instnace_type
    public_subnets_IDs_for_reference = module.aws_vpc_module.public_subnets_IDs_for_reference
    vpc_id_to_use_for_other_modules = module.aws_vpc_module.vpc_id_to_use_for_other_modules

}



