variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "route_table_config" {
  description = "Configuration for route tables and associations"
  type = map(object({
    name      = string
    subnet_id = string
  }))
}
