# Bucket names are global across GCS: replace with your own.
resource "google_storage_bucket" "primary" {
  name     = "mycompany-lab03-primary"
  location = "EUROPE-WEST1"
}

resource "google_storage_bucket" "backup" {
  provider = google.backup

  name     = "mycompany-lab03-backup"
  location = "EUROPE-SOUTHWEST1"
}
