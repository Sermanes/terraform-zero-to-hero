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

resource "google_storage_bucket_object" "readme" {
  name    = "README.txt"
  bucket  = google_storage_bucket.primary.name
  content = "Backup copy of this bucket lives at ${google_storage_bucket.backup.self_link}"
}
