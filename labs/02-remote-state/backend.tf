terraform {
  backend "gcs" {
    # Bucket names are global across GCS: replace with your own.
    # Create it first (see the blog post):
    #   gcloud storage buckets create gs://<your-bucket> \
    #     --project=<your-project> --location=europe-west1 \
    #     --uniform-bucket-level-access --public-access-prevention
    #   gcloud storage buckets update gs://<your-bucket> --versioning
    bucket = "mycompany-terraform-state"
    prefix = "labs/02-remote-state"
  }
}
