# datadog-terraform

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
