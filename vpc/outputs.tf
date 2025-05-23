output "vpc" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnets
}

output "public_subnet_ids" {
  value       = module.vpc.public_subnets
}

output "vpc_cidr_block" {
  value       = module.vpc.vpc_cidr_block
}

