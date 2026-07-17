# Bucket names are global across GCS: the prefix must be unique.
resource "google_storage_bucket" "primary" {
  name     = "${var.bucket_prefix}-primary"
  location = var.primary_location
}

resource "google_storage_bucket" "backup" {
  provider = google.backup

  name     = "${var.bucket_prefix}-backup"
  location = var.backup_location
}
