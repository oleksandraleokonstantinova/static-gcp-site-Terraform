variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "Region for Cloud Run"
}

variable "service_name" {
  type        = string
  description = "Cloud Run service name"
}

variable "image" {
  type        = string
  description = "Container image for Cloud Run"
}
