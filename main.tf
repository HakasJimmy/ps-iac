terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">=5.15.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "gcs" {
    bucket = "tf-ps-iac-state"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.gcp_project.name
  region  = var.gcp_project.region
}

#module "postgresql-db" {
#  source = "./modules/postgresql-db"
#
#  name                = var.database.name
#  db_version          = var.database.version
#  region              = var.database.region
#  machine_type        = var.database.machine_type
#  delete_protection   = var.database.delete_protection
#  disk_size           = var.database.disk_size
#  disk_type           = var.database.disk_type
#  instance_name       = var.database.instance_name
#  project_id          = var.gcp_project.name
#  vpc_name            = var.vpc.name
#  users               = var.database.users
#  authorized_networks = var.database.authorized_networks
#  vpc_self_link       = module.vpc.vpc_self_link
#  replica             = {
#    region            = var.database.replica.region
#    heartbeat_period   = var.database.replica.heartbeat_period
#    delete_protection = var.database.replica.delete_protection
#  }
#}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc.cidr
  vpc_name = var.vpc.name
  subnets  = var.vpc.subnets

}