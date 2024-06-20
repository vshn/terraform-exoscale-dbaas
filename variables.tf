variable "database_instances" {
  description = "A list of database configurations"
  type = list(object({
    name               = string
    type               = string
    plan               = string
    zone               = string
    maintenance_dow    = optional(string, "tuesday")
    maintenance_time   = optional(string, "22:00:00")
    pg_version         = optional(string, "16")
    pg_backup_schedule = optional(string, "04:00")
    pg_timezone        = optional(string, "Europe/Zurich")
    pg_ip_filter       = optional(set(string), [])
  }))
  default = []
}
