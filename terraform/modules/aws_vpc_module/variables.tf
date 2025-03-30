variable "vpc_cidr" {
    description = "Enter the CIDR block for your VPC"
}

variable "vpc_name" {
    description = "Enter the name of your VPC"
}

variable "subnet1_cidr" {
    description = "Enter the CIDR block for your subnet1"
}

variable "my_az_region1" {
    description = "Enter the 1st availability zone for your public subnet"
}

variable "public_subnet1_name" {
    description = "Enter the name of your public subnet 1" 
}

variable "subnet2_cidr" {
    description = "Enter the CIDR block for your subnet2"
}

variable "my_az_region2" {
    description = "Enter the 2nd availability zone for your public subnet"
}

variable "public_subnet2_name" {
    description = "Enter the name of your public subnet 2" 
}

variable "subnet3_cidr" {
    description = "Enter the cidr range for private subnet1"
}

variable "private_subnet1_name" {
    description = "Enter the name of your private subnet 1"
}

variable "subnet4_cidr" {
    description = "Enter the cidr range for private subnet 2"
}

variable "private_subnet2_name" {
    description = "Enter the name of your private subnet 2"
}

variable "my_igw" {
    description = "Enter your internet gateway name"
}

variable "public_route_table_name" {
    description = "Enter the name for your public route table"
}

variable "natgw_name" {
    description = "Enter the name of your natgw"
}

variable "private_route_table_name" {
    description = "Enter the name for your private route table"
}
