provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.101.128.0/20"
  name       = "Apical-Ptod-VPC"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  subnets = {
    subnet1 = {
      cidr_block = "10.0.1.0/24"
      name       = "subnet-one"
    },
    subnet2 = {
      cidr_block = "10.0.2.0/24"
      name       = "subnet-two"
    },
    subnet3 = {
      cidr_block = "10.0.3.0/24"
      name       = "subnet-three"
    },
    subnet4 = {
      cidr_block = "10.0.4.0/24"
      name       = "subnet-four"
    },
    subnet5 = {
      cidr_block = "10.0.5.0/24"
      name       = "subnet-five"
    },
    subnet6 = {
      cidr_block = "10.0.6.0/24"
      name       = "subnet-six"
    },
    subnet7 = {
      cidr_block = "10.0.7.0/24"
      name       = "subnet-seven"
    },
    subnet8 = {
      cidr_block = "10.0.8.0/24"
      name       = "subnet-eight"
    },
    subnet9 = {
      cidr_block = "10.0.9.0/24"
      name       = "subnet-nine"
    }
  }
}

module "route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  route_table_config = {
    route_table1 = {
      name      = "route-table-one"
      subnet_id = module.subnet.subnet_ids["subnet1"]
    }
    route_table2 = {
      name      = "route-table-two"
      subnet_id = module.subnet.subnet_ids["subnet2"]
    }
    route_table3 = {
      name      = "route-table-three"
      subnet_id = module.subnet.subnet_ids["subnet3"]
    }
    route_table4 = {
      name      = "route-table-four"
      subnet_id = module.subnet.subnet_ids["subnet4"]
    }
    route_table5 = {
      name      = "route-table-five"
      subnet_id = module.subnet.subnet_ids["subnet5"]
    }
    route_table6 = {
      name      = "route-table-six"
      subnet_id = module.subnet.subnet_ids["subnet6"]
    }
    route_table7 = {
      name      = "route-table-seven"
      subnet_id = module.subnet.subnet_ids["subnet7"]
    }
    route_table8 = {
      name      = "route-table-eight"
      subnet_id = module.subnet.subnet_ids["subnet8"]
    }
    route_table9 = {
      name      = "route-table-nine"
      subnet_id = module.subnet.subnet_ids["subnet9"]
    }
  }
}
