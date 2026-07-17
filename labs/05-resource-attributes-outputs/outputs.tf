output "primary_bucket_url" {
  description = "gs:// URL of the primary bucket, for use with gsutil or another process."
  value       = google_storage_bucket.primary.url
}

output "backup_bucket_self_link" {
  description = "API URL of the backup bucket."
  value       = google_storage_bucket.backup.self_link
}

output "readme_object_id" {
  description = "Full ID of the README.txt object (bucket/name)."
  value       = google_storage_bucket_object.readme.id
}
