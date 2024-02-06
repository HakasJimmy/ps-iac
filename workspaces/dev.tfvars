gcp_project = {
  "name" : "rmfarma-dev",
  "region" : "southamerica-east1",
}

database = {
  instance_name     = "pharma-sync-dev"
  name              = "pharma-sync-dev"
  region            = "southamerica-east1"
  version           = "POSTGRES_15"
  machine_type      = "db-f1-micro"
  disk_size         = 20
  disk_type         = "pd-standard"
  delete_protection = false
  users             = [
    {
      name     = "ps-user-master"
      password = "ps-user-master@123"
    }
  ]
  authorized_networks = {
    "public" = "0.0.0.0/0"
  }
  replica = {
    region            = "southamerica-east1"
    heartbeat_period  = "1000" # milliseconds
    delete_protection = false
  }

}

vpc = {
  name    = "pharma-sync-dev-vpc"
  cidr    = "10.0.0.0/16"
  subnets = [
    {
      name = "pharma-sync-dev-subnet"
      cidr = "10.0.0.0/16"
    }
  ]
}