resource "google_sql_user" "user" {
  for_each = { for u in var.users : u.name => u }

  name     = each.value.name
  password = each.value.password
  instance = google_sql_database_instance.ps-db-instance.name
}