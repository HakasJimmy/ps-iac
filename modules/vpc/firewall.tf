resource "google_compute_firewall" "allow_db_access" {
  provider    = google
  name        = "allow-db-access"
  network     = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["5432"]
  }

  source_ranges = [ var.vpc_cidr ] # Substitua pelo CIDR correto da sua VPC ou sub-redes específicas.
}
