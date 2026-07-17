provider "google" {
  project = var.project
  region  = var.primary_region
}

provider "google" {
  alias   = "backup"
  project = var.project
  region  = var.backup_region
}
