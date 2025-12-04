resource "google_cloud_run_v2_service" "static_site" {
  name     = "static-site"
  location = var.region

  template {
    containers {
      image = var.image

      ports {
        container_port = 8080
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}
#о IAM для публічного доступу
resource "google_cloud_run_v2_service_iam_member" "public_invoker" {
  project  = var.project_id
  location = var.region
  name     = google_cloud_run_v2_service.static_site.name

  role   = "roles/run.invoker"
  member = "allUsers"
}
