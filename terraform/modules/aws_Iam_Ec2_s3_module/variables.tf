
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
variable "my_iam_role" {
  description = "The name of the IAM role"
  type        = string
}
variable "my_ami" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string

}

variable "my_instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}


variable "vpc_id_to_use_for_other_modules" {
  description = "take vpc id from vpc module"
  
}

variable "public_subnets_IDs_for_reference" {
  description = "take subnetID from vpc_module"
  type = list(string)
}

