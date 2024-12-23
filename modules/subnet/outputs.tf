output "subnet_ids" {
  description = "Subnet IDs"
  value       = { for k, v in aws_subnet.data_warehouse_prod : k => v.id }
}
