---
to: version.tf
---
terraform {
  required_version = "<%= tfversion %>"
}

provider "google" {}
