variable "vpc_cidr" {
    description = "Choose vpc cidr block"
default = "172.20.0.0/16"
}

variable "Public_subnet_cidr" {
    description = "Choose public subnet cidr block"
    type = list(string)
default = ["172.20.0.0/24","172.20.1.0/24","172.20.2.0/24"]
}

