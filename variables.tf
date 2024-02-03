variable "gcp_project" {
  type = object({
    name   = string
    region = string
  })
}

variable "database" {
  type = object({
    instance_name     = string
    name              = string
    region            = string
    version           = string
    machine_type      = string
    delete_protection = bool
    disk_size         = number
    disk_type         = string
    users             = list(object({
      name     = string
      password = string
    }))
  })
}

variable "vpc" {
  type = object({
    name    = string
    subnets = list(object({
      name   = string
      cidr   = string
    }))
  })
}