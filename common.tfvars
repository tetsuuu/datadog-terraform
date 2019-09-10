provider "datadog" {
  api_key = "${var.api_key}"
  app_key = "${var.app_key}"
  version = "2.1.0"
}
