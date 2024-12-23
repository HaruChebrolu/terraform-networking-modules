resource "aws_route_table" "data_warehouse_prod_route_table" {
  for_each = var.route_table_config

  vpc_id = var.vpc_id

  tags = {
    Name = each.value.name
  }
}

resource "aws_route_table_association" "data_warehouse_prod_route_table_association" {
  for_each = var.route_table_config

  subnet_id      = each.value.subnet_id
  route_table_id = aws_route_table.main[each.key].id
}
