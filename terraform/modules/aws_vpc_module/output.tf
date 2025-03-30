output "vpc_id_to_use_for_other_modules"{
    value = aws_vpc.devops_vpc.id
}

output "private_subnets_IDs_for_ASG" {
    value = [aws_subnet.devops_private_subnet1.id,aws_subnet.devops_private_subnet2.id]
}

output "public_subnets_IDs_for_reference" {
    value = [aws_subnet.devops_public_subnet1.id,aws_subnet.devops_public_subnet2.id]
}

