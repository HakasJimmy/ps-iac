resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  for_each      = { for s in var.subnets : s.name => s }

  name          = each.value.name
  ip_cidr_range = each.value.cidr
  network       = google_compute_network.vpc.self_link
}
