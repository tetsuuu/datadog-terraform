resource "datadog_monitor" "webserver_freeable_strage" {
    evaluation_delay    = 0
    include_tags        = true
    locked              = false
    message             = "@slack-alert_kurapuri"
    name                = "kurapuri-prod-web disk free lowly"
    new_host_delay      = 300
    no_data_timeframe   = 0
    notify_audit        = false
    notify_no_data      = false
    query               = "avg(last_5m):avg:system.disk.free{name:kurapuri-prod-web} < 1000000000"
    renotify_interval   = 0
    require_full_window = true
    silenced            = {}
    tags                = []
    threshold_windows   = {}
    thresholds          = {
        "critical" = "1000000000.0"
        "warning"  = "4000000000.0"
    }
    timeout_h           = 0
    type                = "metric alert"
}

resource "datadog_monitor" "rds_freeable_strage" {
    evaluation_delay    = 0
    include_tags        = true
    locked              = false
    message             = "@slack-alert_kurapuri"
    name                = "kurapuri rds free storage lowly"
    new_host_delay      = 300
    no_data_timeframe   = 0
    notify_audit        = false
    notify_no_data      = false
    query               = "avg(last_5m):avg:aws.rds.free_storage_space{dbname:kurapuri} < 2000000000"
    renotify_interval   = 0
    require_full_window = true
    silenced            = {}
    tags                = []
    threshold_windows   = {}
    thresholds          = {
        "critical" = "2000000000.0"
        "warning"  = "3000000000.0"
    }
    timeout_h           = 0
    type                = "metric alert"
}

resource "datadog_monitor" "elasticache_frreable_memoly" {
    evaluation_delay    = 0
    include_tags        = true
    locked              = false
    message             = "@slack-alert_kurapuri"
    name                = "kurapuri elasticahe free mem lowly"
    new_host_delay      = 300
    no_data_timeframe   = 0
    notify_audit        = false
    notify_no_data      = false
    query               = "avg(last_5m):avg:aws.elasticache.freeable_memory{name:kurapuri-prod-redis} < 128000000"
    renotify_interval   = 0
    require_full_window = true
    silenced            = {}
    tags                = []
    threshold_windows   = {}
    thresholds          = {
        "critical" = "128000000.0"
        "warning"  = "256000000.0"
    }
    timeout_h           = 0
    type                = "metric alert"
}

resource "datadog_monitor" "cloudfront_5xx_count" {
    evaluation_delay    = 0
    include_tags        = true
    locked              = false
    message             = "@slack-alert_kurapuri"
    name                = "kurapuri CloudFront 5xx rate is highly"
    new_host_delay      = 300
    no_data_timeframe   = 0
    notify_audit        = false
    notify_no_data      = false
    query               = "avg(last_5m):avg:aws.cloudfront.5xx_error_rate{distributionid:e2lpz2n9zxv63z} > 0.1"
    renotify_interval   = 0
    require_full_window = true
    silenced            = {}
    tags                = []
    threshold_windows   = {}
    thresholds          = {
        "critical" = "0.1"
        "warning"  = "0.05"
    }
    timeout_h           = 0
    type                = "metric alert"
}
