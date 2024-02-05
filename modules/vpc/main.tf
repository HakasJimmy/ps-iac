resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  for_each = {for s in var.subnets : s.name => s}

  name          = each.value.name
  ip_cidr_range = each.value.cidr
  network       = google_compute_network.vpc.self_link
}

resource "google_compute_global_address" "private_ip_range" {
  provider      = google
  name          = "google-sql-private-services-access"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc.self_link
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_range.name]
}