terraform {
  required_version = "0.12.5"
}

variable "api_key" {}
variable "app_key" {}

provider "datadog" {
  api_key = "${var.api_key}"
  app_key = "${var.app_key}"
  version = "2.1.0"
}
