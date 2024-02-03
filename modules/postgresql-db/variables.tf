variable "instance_name" {
  type = string
}

variable "region" {
  default = "southamerica-east1"
}

variable "machine_type" {
  type = string
}

variable "name" {
  type = string
}

variable "delete_protection" {
  type = bool
}

variable "db_version" {
  type = string
}

variable "disk_size" {
  type = number
}

variable "disk_type" {
  type = string
}

variable "users" {
  type = list(object({
    name     = string
    password = string
  }))
}

variable "vpc_name" {
  type = string
}

variable "project_id" {
  type = string
}