variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default = "10.1.0.0/16"
}
variable "cidr_subnet_public" {
  description = "CIDR block for the subnet"
  default = "10.1.0.0/17"
}

variable "cidr_subnet_private" {
  description = "CIDR block for the subnet"
  default = "10.0.128.0/17"
}
