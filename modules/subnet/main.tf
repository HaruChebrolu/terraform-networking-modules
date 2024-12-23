resource "aws_subnet" "data_warehouse_prod" {
  for_each   = var.subnets
  vpc_id     = var.vpc_id
  cidr_block = each.value.cidr_block

  tags = {
    Name = each.value.name
  }
}
