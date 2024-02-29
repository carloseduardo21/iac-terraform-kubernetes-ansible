output "vpc_arn" {
  value = aws_vpc.this.arn
}

output "internet_gateway_arn" {
  value = aws_internet_gateway.this.arn
}

output "public_subnets_arns" {
  value = aws_subnet.publics[*].arn
}

output "nat_gateway_arns" {
  value = aws_nat_gateway.this.id
}

output "private_subnets_arn" {
  value = aws_subnet.privates[*].arn
}

output "endpoint" {
  value = aws_eks_cluster.this.endpoint
}