gcp_project = {
  "name" : "rmfarma-dev",
  "region" : "southamerica-east1",
}


database = {
  instance_name     = "jimmy-db"
  name              = "jimmy-db"
  region            = "southamerica-east1"
  version           = "POSTGRESQL_15"
  machine_type      = "db-f1-micro"
  disk_size         = 80
  disk_type         = "pd-standard"
  delete_protection = false
  users             = [
    {
      name     = "jimmy"
      password = "jimmy"
    }
  ]
}

vpc = {
  name    = "jimmy-vpc"
  subnets = [
    {
      name   = "jimmy-subnet"
      cidr   = "10.0.0.0/16"
    }
  ]
}