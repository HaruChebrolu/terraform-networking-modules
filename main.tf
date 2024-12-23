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
      cidr_block = "10.101.128.0/28"
      name       = "apical-prod-transit-Subnet-private-ap-southeast-1a"
    },
    subnet2 = {
      cidr_block = "10.101.128.16/28"
      name       = "apical-prod-transit-Subnet-private-ap-southeast-1b "
    },
    subnet3 = {
      name = "apical-prod-transit-Subnet-private-ap-southeast-1c"
      cidr_block       = "10.101.128.32/28"
    },
    subnet4 = {
      cidr_block = "10.101.132.0/22"
      name       = "apical-prod-workload-Subnet-private-ap-southeast-1a"
    },
    subnet5 = {
      cidr_block = "10.101.136.0/22"
      name       = "apical-prod-workload-Subnet-private-ap-southeast-1b"
    },
    subnet6 = {
      cidr_block = "10.101.140.0/22"
      name       = "apical-prod-workload-Subnet-private-ap-southeast-1c"
    },
    subnet7 = {
      cidr_block = "10.101.144.0/25"
      name       = "apical-prod-integration-Subnet-private-ap-southeast-1a"
    },
    subnet8 = {
      cidr_block = "10.101.144.128/25"
      name       = "apical-prod-integration-Subnet-private-ap-southeast-1b"
    },
    subnet9 = {
      cidr_block = "10.101.145.0/25"
      name       = "apical-prod-integration-Subnet-private-ap-southeast-1c"
    }
  }
}

module "route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  route_table_config = {
    route_table1 = {
      name      = "apical-prod-integration-rtb-private-ap-southeast-1a"
      subnet_id = module.subnet.subnet_ids["subnet1"]
    }
    route_table2 = {
      name      = "apical-prod-integration-rtb-private-ap-southeast-1b"
      subnet_id = module.subnet.subnet_ids["subnet2"]
    }
    route_table3 = {
      name      = "apical-prod-integration-rtb-private-ap-southeast-1c"
      subnet_id = module.subnet.subnet_ids["subnet3"]
    }
    route_table4 = {
      name      = "apical-prod-workload-rtb-private-ap-southeast-1a"
      subnet_id = module.subnet.subnet_ids["subnet4"]
    }
    route_table5 = {
      name      = "apical-prod-workload-rtb-private-ap-southeast-1b"
      subnet_id = module.subnet.subnet_ids["subnet5"]
    }
    route_table6 = {
      name      = "apical-prod-workload-rtb-private-ap-southeast-1c"
      subnet_id = module.subnet.subnet_ids["subnet6"]
    }
    route_table7 = {
      name      = "apical-prod-transit-rtb-private-ap-southeast-1a"
      subnet_id = module.subnet.subnet_ids["subnet7"]
    }
    route_table8 = {
      name      = "apical-prod-transit-rtb-private-ap-southeast-1b"
      subnet_id = module.subnet.subnet_ids["subnet8"]
    }
    route_table9 = {
      name      = "apical-prod-transit-rtb-private-ap-southeast-1c"
      subnet_id = module.subnet.subnet_ids["subnet9"]
    }
  }
}
