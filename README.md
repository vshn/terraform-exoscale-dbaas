# VSHN Terraform Module Exoscale DBaaS

This module does the following:

- Create DBaaS on Exoscale
- This version of the module only supports database type "pg"
- Other db types would require some more implementation effort

Docs for the Exoscale provider (for databases): https://registry.terraform.io/providers/exoscale/exoscale/latest/docs/resources/database

## Example usage

```hcl
module "dbaas" {
  source = "git::ssh://git@git.vshn.net/vshn-terraform/module-exoscale-dbaas.git?ref=v1.0.0"
  databases = var.databases
}
```

```hcl
database_instances = [
  {
    name               = "myapp-pg"
    type               = "pg"
    plan               = "hobbyist-2"
    zone               = "ch-gva-2"
    maintenance_dow    = "wednesday"
    maintenance_time   = "21:15:00"
    pg_version         = "16"
    pg_backup_schedule = "05:00"
    pg_timezone        = "Europe/Zurich"
    pg_ip_filter       = ["192.168.16.0/24", "10.0.0.0/8", "8.8.8.8/32"]
  }
]
```

```hcl
variable "database_instances" {
  description = "A list of database configurations"
  type = list(object({
    name                = string
    type                = string
    plan                = string
    zone                = string
    maintenance_dow     = optional(string)
    maintenance_time    = optional(string)
    pg_version          = optional(string)
    pg_backup_schedule  = optional(string)
    pg_timezone         = optional(string)
    pg_ip_filter        = optional(set(string))
  }))
  default = []
}
```
