resource "datadog_monitor" "enphoto_prod_sqs_count" {
    evaluation_delay    = 0
    include_tags        = true
    locked              = false
    message             = "@slack-alert_en-photo"
    name                = "【queuename : enphoto-prod】sqs count highly"
    new_host_delay      = 300
    no_data_timeframe   = 0
    notify_audit        = false
    notify_no_data      = false
    query               = "avg(last_5m):max:aws.sqs.approximate_number_of_messages_visible{project:enphoto,queuename:enphoto-prod} + max:aws.sqs.approximate_number_of_messages_not_visible{project:enphoto,queuename:enphoto-prod} > 2000"
    renotify_interval   = 0
    require_full_window = true
    silenced            = {}
    tags                = []
    threshold_windows   = {}
    thresholds          = {
        "critical" = "2000.0"
        "warning"  = "1000.0"
    }
    timeout_h           = 0
    type                = "query alert"
}

resource "datadog_monitor" "createthumbnail_function" {
    evaluation_delay    = 0
    include_tags        = false
    locked              = false
    message             = "@slack-alert_en-photo"
    name                = "enphoto createthumbnail lambda function error highly"
    new_host_delay      = 300
    no_data_timeframe   = 0
    notify_audit        = false
    notify_no_data      = false
    query               = "sum(last_1m):avg:aws.lambda.errors{functionname:enphoto-prod-createthumbnail}.as_count() > 10"
    renotify_interval   = 0
    require_full_window = true
    silenced            = {}
    tags                = []
    threshold_windows   = {}
    thresholds          = {
        "critical" = "10.0"
        "warning"  = "5.0"
    }
    timeout_h           = 0
    type                = "query alert"
}

resource "datadog_monitor" "enphoto_prod_high_sqs_count" {
    evaluation_delay    = 0
    include_tags        = true
    locked              = false
    message             = "@slack-alert_en-photo"
    name                = "【queuename : enphoto-prod-high】sqs count highly"
    new_host_delay      = 300
    no_data_timeframe   = 0
    notify_audit        = false
    notify_no_data      = false
    query               = "avg(last_5m):max:aws.sqs.approximate_number_of_messages_visible{project:enphoto,queuename:enphoto-prod-high} + max:aws.sqs.approximate_number_of_messages_not_visible{project:enphoto,queuename:enphoto-prod-high} > 100"
    renotify_interval   = 0
    require_full_window = true
    silenced            = {}
    tags                = []
    threshold_windows   = {}
    thresholds          = {
        "critical" = "100.0"
        "warning"  = "50.0"
    }
    timeout_h           = 0
    type                = "query alert"
}

resource "datadog_monitor" "elasticache_frreable_memoly" {
    evaluation_delay    = 0
    include_tags        = true
    locked              = false
    message             = "@slack-alert_en-photo"
    name                = "enphoto elasticache free mem lowly"
    new_host_delay      = 300
    no_data_timeframe   = 0
    notify_audit        = false
    notify_no_data      = false
    query               = "avg(last_5m):avg:aws.elasticache.freeable_memory{project:enphoto} < 128000000"
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
    message             = "@slack-alert_en-photo"
    name                = "enphoto CloudFront 5xx rate is highly"
    new_host_delay      = 300
    no_data_timeframe   = 0
    notify_audit        = false
    notify_no_data      = false
    query               = "avg(last_5m):avg:aws.cloudfront.5xx_error_rate{project:enphoto,distributionid:e1jd6pajlbwj2q} > 0.1"
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

resource "datadog_monitor" "rds_freeable_strage" {
    evaluation_delay    = 0
    include_tags        = true
    locked              = false
    message             = "@slack-alert_en-photo"
    name                = "enphoto rds free storage lowly"
    new_host_delay      = 300
    no_data_timeframe   = 0
    notify_audit        = false
    notify_no_data      = false
    query               = "avg(last_5m):avg:aws.rds.free_storage_space{name:enphoto-prod} < 2000000000"
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

resource "datadog_monitor" "webserver_freeable_strage" {
    evaluation_delay    = 0
    include_tags        = true
    locked              = false
    message             = "@slack-alert_en-photo"
    name                = "enphoto-prod-web disk free lowly"
    new_host_delay      = 300
    no_data_timeframe   = 0
    notify_audit        = false
    notify_no_data      = false
    query               = "avg(last_5m):avg:system.disk.free{project:enphoto} < 1000000000"
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

resource "datadog_monitor" "ses_bounce_count" {
    evaluation_delay    = 0
    include_tags        = false
    locked              = false
    message             = "@slack-alert_en-photo"
    name                = "enphoto SES バウンスレート監視"
    new_host_delay      = 300
    no_data_timeframe   = 0
    notify_audit        = false
    notify_no_data      = false
    query               = "avg(last_1h):max:aws.ses.reputation_bounce_rate{project:enphoto} > 0.1"
    renotify_interval   = 0
    require_full_window = true
    silenced            = {}
    tags                = []
    threshold_windows   = {}
    thresholds          = {
        "critical"          = "0.1"
        "critical_recovery" = "0.08"
        "warning"           = "0.05"
        "warning_recovery"  = "0.03"
    }
    timeout_h           = 0
    type                = "query alert"
}

resource "datadog_monitor" "enphoto_prod_low_sqs_count" {
    evaluation_delay    = 0
    include_tags        = true
    locked              = false
    message             = "@slack-alert_en-photo"
    name                = "【queuename : enphoto-prod-low】sqs count highly"
    new_host_delay      = 300
    no_data_timeframe   = 0
    notify_audit        = false
    notify_no_data      = false
    query               = "avg(last_5m):max:aws.sqs.approximate_number_of_messages_visible{project:enphoto,queuename:enphoto-prod-low} + max:aws.sqs.approximate_number_of_messages_not_visible{project:enphoto,queuename:enphoto-prod-low} > 30000"
    renotify_interval   = 0
    require_full_window = true
    silenced            = {}
    tags                = []
    threshold_windows   = {}
    thresholds          = {
        "critical" = "30000.0"
        "warning"  = "15000.0"
    }
    timeout_h           = 0
    type                = "query alert"
}
