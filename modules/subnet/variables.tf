variable "vpc_id" {
  description = "VPC ID where subnets will be created"
  type        = string
}

variable "subnets" {
  description = "Map of subnet configurations, including CIDR block, name, availability zone, and IP mapping"
  type = map(object({
    cidr_block = string
    name       = string
  }))
}

