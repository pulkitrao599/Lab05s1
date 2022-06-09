variable "rg1" {
   default      = "TerraformRG"
   type         = string
   description  = "This var is for resources"
}

variable "location" {
   default = "Australia Central"
}

variable "v_net" {
   default = "network-vnet"
}

variable "vnet_addr_space" {
   default = ["10.0.0.0/16"]
}

variable "subnet1" {
    default = "network-subnet1"
}

variable "subnet2" {
    default = "network-subnet2"
}

variable "subnet1_address_prefixes" {
    default = ["10.0.1.0/24"]
}

variable "subnet2_address_prefixes" {
    default = ["10.0.2.0/24"]
}

variable "nsg1" {
  type = map(string)
  default = {
    "name" = "network-nsg1"
    "security_rule" = "rule"
     priority = 100
     destination_port_range  = 22
  }
}

variable "nsg2" {
  type = map(string)
  default = {
    "name" = "network-nsg2"
    "security_rule1" = "rule1"
     priority1 = 100
     destination_port_range1  = 3389
     "security_rule2" = "rule2"
      priority2 = 200
      destination_port_range2  = 5985
  }
}
