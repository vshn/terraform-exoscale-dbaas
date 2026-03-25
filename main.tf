resource "exoscale_dbaas" "database_instances" {
  for_each               = { for db in var.database_instances : db.name => db }
  zone                   = each.value.zone
  name                   = "${terraform.workspace}-${each.value.name}"
  type                   = each.value.type
  plan                   = each.value.plan
  maintenance_dow        = each.value.maintenance_dow
  maintenance_time       = each.value.maintenance_time
  termination_protection = true

  pg = each.value.type == "pg" ? {
    version         = each.value.pg_version
    backup_schedule = each.value.pg_backup_schedule
    ip_filter       = each.value.pg_ip_filter
    pg_settings     = jsonencode({ "timezone" = each.value.pg_timezone })
  } : null
}
