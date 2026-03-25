terraform {
  required_version = ">= 1.8.0"
  required_providers {
    exoscale = {
      source  = "exoscale/exoscale"
      version = ">=0.68.0"
    }
  }
}
