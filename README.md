# datadog-terraform

Manage monitoring setting by Terraform.
Easy to deploy && change setting.

## Directory Strategy

```
.
├── enphoto
│   ├── main.tf
│   ├── dadabase.tf
│   ├── webserver.tf
│   └── outline.tf
├── kurapuri
│   ├── main.tf
│   ├── dadabase.tf
│   ├── webserver.tf
│   └── outline.tf
├── kurapuri
│   ├── main.tf
│   ├── dadabase.tf
│   ├── webserver.tf
│   └── outline.tf
├── hogehoge
│   ├── event_warning.tpl
│   ├── event_critical.tpl
│   ├── metric_warning.tpl
│   └── metric_critical.tpl
└── common.tfvars
```

How to management users?
1. Just put root dir.
2. Make dir for users.

Have to be managed by common resource on which strategies.

## Key management

```hcl-terraform
terraform {
  required_version = "0.12.5"
}

provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}
```

Above are injected by CircleCI or prepare deployment Jenkins from somewhere.

 
