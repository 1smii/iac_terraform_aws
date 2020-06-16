variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "region" {
  default = "eu-west-3" # Paris
}

# Rango direcciones subnets privadas
variable "private-subnet1-cidr" {
  description = "Rango de direcciones de la subred privada 1"
  default     = "10.0.1.0/24"
}
variable "private-subnet2-cidr" {
  description = "Rango de direcciones de la subred privada 2"
  default     = "10.0.2.0/24"
}

# Rango direcciones subnets publicas
variable "public-subnet1-cidr" {
  description = "Rango de direcciones de la subred publica 1"
  default     = "10.0.3.0/24"
}
variable "public-subnet2-cidr" {
  description = "Rango de direcciones de la subred publica 2"
  default     = "10.0.4.0/24"
}

# Zonas disponibles
variable "zone_a" {
  default = "eu-west-3a"
}

variable "zone_b" {
  default = "eu-west-3b"
}

variable "zone_c" {
  default = "eu-west-3c"
}

# INSTANCIAS EC2
variable "ami_id" {
  default = "ami-08c757228751c5335" # Ubuntu 18.04 LTS
}

variable "amii_id" {
  default = "ami-0a7bc8e13471419ff" # Ubuntu 18.04 LTS zoneb
}

variable "instance_type" {
  default = "t2.micro"
}

