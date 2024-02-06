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

variable "vpc_self_link" {
  description = "O link de auto serviço da VPC para uso com a instância de banco de dados."
  type        = string
}

variable "authorized_networks" {
  type        = map(string)
  description = "Mapa de redes autorizadas para acesso ao banco de dados."
}

variable "replica" {
  type = object({
    region            = string
    delete_protection = bool
    heartbeat_period  = string
  })
}