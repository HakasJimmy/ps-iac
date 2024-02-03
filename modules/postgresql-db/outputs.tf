// enable a public IP address for the instance
output "instance_ip" {
  value = google_sql_database_instance.ps-db-instance.ip_address[0].ip_address
}