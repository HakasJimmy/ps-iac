variable "vpc_name" {
  type = string
}

variable "subnets" {
  type = list(object({
    name = string
    cidr = string
    region = string
  }))
}
