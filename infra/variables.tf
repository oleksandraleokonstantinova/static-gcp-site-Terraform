variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "GCP region (e.g. us-central1)"
}

variable "service_name" {
  type        = string
  description = "Cloud Run service name"
}

variable "image" {
  type        = string
  description = "Container image for Cloud Run (gcr.io/.../image:tag)"
}

variable "public_member" {
  type        = string
  description = "Principal who can invoke Cloud Run service"
  default     = "allUsers"
}
