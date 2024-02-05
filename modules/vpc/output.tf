output "vpc_self_link" {
  value = google_compute_global_address.private_ip_range.network
}
