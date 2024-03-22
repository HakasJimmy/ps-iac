gcp_project = {
  "name" : "rmfarma",
  "region" : "southamerica-east1",
}

database = {
  instance_name     = "pharma-sync"
  name              = "pharma-sync"
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
  name    = "rm-vpc"
  cidr    = "10.8.0.0/28"
  subnets = [
    {
      name   = "rm-subnet-1"
      cidr   = "10.0.1.0/24",
      region = "southamerica-east1"
    },
    {
      name   = "rm-subnet-2"
      cidr   = "10.0.2.0/24",
      region = "us-east1"
    }
  ]
}