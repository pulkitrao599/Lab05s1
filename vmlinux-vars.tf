locals {
  common_tags = {
    Name : "Terraform-Class"
    Project : "Learning"
    ContactEmail : "raopulkit599@gmail.com"
    Environment : "Lab"
  }
}

variable "linux_avs" {
  default = "lab-db1-u-vm"
}

variable "nb_count" {
  default = "2"
}

variable "linux_name" {
    default = "lab02s3-db1-u-vm1"
}

variable "linux_size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "n01421308"
}

variable "admin_password" {
  default = "Superm@n2020"
}

variable "OS_disk" {
  type = map(string)
  default = {
      storage_account_type ="Premium_LRS"
      disk_size = 32
      caching = "ReadWrite"
  }
}

variable "UbuntuLinuxOS" {
    type = map(string)
    default = {
       publisher = "Canonical"
       offer = "UbuntuServer"
       sku = "19.04"
       version = "latest"
    }
  
}