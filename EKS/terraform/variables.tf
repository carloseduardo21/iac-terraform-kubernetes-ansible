variable "tags" {
  type = object({
    environment = string,
    project     = string
  })
  default = {
    environment = "Production"
    project     = "EKS"
  }
}

variable "vpc" {
  type = object({
    name                        = string,
    cidr                        = string,
    internet_gateway_name       = string,
    public_route_table_name     = string,
    private_route_table_name    = string,
    nat_gateway_elastic_ip_name = string,
    nat_gateway_name            = string
  })
  default = {
    name                        = "eks-vpc"
    cidr                        = "10.0.0.0/24"
    internet_gateway_name       = "eks-internet-gateway"
    public_route_table_name     = "eks-public-route-table"
    private_route_table_name    = "eks-private-route-table"
    nat_gateway_elastic_ip_name = "eks-nat-gateway-elastic-ip"
    nat_gateway_name            = "eks-nat-gateway-"
  }
}

variable "public_subnets" {
  type = list(object({
    name                    = string
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
  }))

  default = [{
    name                    = "eks-public-subnet-1a",
    cidr_block              = "10.0.0.0/26",
    availability_zone       = "us-west-1a",
    map_public_ip_on_launch = true
    },
    {
      name                    = "eks-public-subnet-1c",
      cidr_block              = "10.0.0.64/26",
      availability_zone       = "us-west-1c",
      map_public_ip_on_launch = true
  }]
}

variable "private_subnets" {
  type = list(object({
    name                    = string
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
  }))

  default = [{
    name                    = "eks-private-subnet-1a",
    cidr_block              = "10.0.0.128/26",
    availability_zone       = "us-west-1a",
    map_public_ip_on_launch = false
    },
    {
      name                    = "eks-public-subnet-1c",
      cidr_block              = "10.0.0.192/26",
      availability_zone       = "us-west-1c",
      map_public_ip_on_launch = false
  }]
}

variable "eks_cluster" {
  type = object({
    name                      = string,
    enabled_cluster_log_types = list(string)
  })
  default = {
    name                      = "eks-cluster"
    enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  }
}

variable "dns" {
  type = string
  default = "strongsoftwares.com.br"
}