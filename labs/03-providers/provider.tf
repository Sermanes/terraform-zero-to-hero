provider "google" {
  # Replace with your own project.
  project = "my-project"
  region  = "europe-west1"
}

provider "google" {
  alias = "backup"

  # Replace with your own project.
  project = "my-project"
  region  = "europe-southwest1"
}
