output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.vpc.id
}

output "vpc_cidr" {
  description = "VPC CDIR."
  value       = aws_vpc.vpc.cidr_block
}

output "private_dns_zone_id" {
  description = "ID of the the private DNS zone, optional."
  value       = element(concat(aws_route53_zone.local.*.id, [""]), 0)
}

output "private_domain_name" {
  description = "Private domain name, optional."
  value       = element(concat(aws_route53_zone.local.*.name, [""]), 0)
}

output "nat_gateway_public_ip" {
  description = "Public IP address of the NAT gateway."
  value       = element(concat(aws_nat_gateway.nat.*.public_ip, [""]), 0)
}

output "public_subnets" {
  description = "List of the public subnets."
  value       = aws_subnet.public_subnet.*.id
}

output "private_subnets" {
  description = "List of the private subnets."
  value       = aws_subnet.private_subnet.*.id
}

output "availability_zones" {
  description = "List of the availability zones."
  value       = local.az
}

output "public_subnets_route_table" {
  value = aws_route_table.public_routetable.id
}

output "private_subnets_route_table" {
  value = element(concat(aws_route_table.private_routetable.*.id, [""]), 0)
}

output "subnet_azs" {
  value = [
    for subnet in aws_subnet.public_subnet :
    {
      az     = subnet.availability_zone
      subnet = subnet.id
    }
  ]
}
