output "route_table_ids" {
  description = "IDs of the route tables"
  value       = { for k, v in aws_route_table.data_warehouse_prod_route_table : k => v.id }
}
