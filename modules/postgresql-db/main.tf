resource "google_sql_database_instance" "pharma-sync-dev" {
  name             = var.instance_name
  database_version = var.db_version
  region           = var.region

  deletion_protection = var.delete_protection


  settings {
    tier      = var.machine_type
    disk_size = var.disk_size
    disk_type = var.disk_type

    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = var.vpc_self_link
      enable_private_path_for_google_cloud_services = true
      require_ssl                                   = false

      dynamic "authorized_networks" {
        for_each = var.authorized_networks
        content {
          name  = authorized_networks.key
          value = authorized_networks.value
        }
      }
    }

    location_preference {
      zone = "southamerica-east1-a"
    }

    backup_configuration {
      enabled = true
    }
  }
}

resource "google_sql_database" "pharma-sync-dev" {
  name     = var.name
  instance = var.instance_name
}

resource "google_sql_database_instance" "pharma-sync-dev-replica" {
  name                 = "${var.instance_name}-replica"
  database_version     = var.db_version
  region               = var.region
  master_instance_name = google_sql_database_instance.pharma-sync-dev.name

  replica_configuration {
    // define o intervalo de tempo entre as verificações de heartbeats enviadas pela réplica para a instância principal
    master_heartbeat_period = "1000"
  }

  settings {
    tier = var.machine_type
    // Garantir que as configurações aqui sejam compatíveis com as da instância principal
  }
}