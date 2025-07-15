---
to: versions.tf
---
terraform {
  required_version = "<%= tfversion %>"
}

provider "google" {}
