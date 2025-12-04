terraform {
  backend "gcs" {
    bucket = "tf-state-static-site"   # назва bucket’а
    prefix = "prod"                   # папка 
  }
}
