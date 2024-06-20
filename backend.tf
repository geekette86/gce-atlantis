terraform {
  backend "gcs" {
    bucket = "atlantis-state"
  }
}

