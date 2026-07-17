variable "project" {
  description = "GCP project ID where the buckets are created."
  type        = string
}

variable "primary_region" {
  description = "Region for the primary provider config."
  type        = string
  default     = "europe-west1"
}

variable "backup_region" {
  description = "Region for the backup provider config."
  type        = string
  default     = "europe-southwest1"
}

variable "primary_location" {
  description = "GCS location for the primary bucket."
  type        = string
  default     = "EUROPE-WEST1"
}

variable "backup_location" {
  description = "GCS location for the backup bucket."
  type        = string
  default     = "EUROPE-SOUTHWEST1"
}

variable "bucket_prefix" {
  description = "Prefix used to build the primary and backup bucket names."
  type        = string
  default     = "mycompany-lab04"
}
