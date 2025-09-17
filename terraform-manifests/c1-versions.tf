terraform {
  required_version = ">=1.13.1"
  required_providers {
    google = {
        source= "hashicorp/google"
        version = "~> 7.2.0"
    }
  }
}

provider "google" {
  project = "cks-gcp"
  region = "europe-north2"
}