resource "datadog_dashboard" "project_enphoto" {
    is_read_only = false
    layout_type  = "ordered"
    notify_list  = []
    title        = "project:en-photo"

    template_variable {
        default = "*"
        name    = "var"
    }

    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "Avg of aws.elasticache.freeable_memory over project:enphoto"

            request {
                display_type = "line"
                q            = "avg:aws.elasticache.freeable_memory{project:enphoto}"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "enphoto-prod-web disk free"

            request {
                display_type = "line"
                q            = "avg:system.disk.free{project:enphoto}"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "enphoto-prod-web ELB request count"

            request {
                display_type = "bars"
                q            = "max:aws.elb.httpcode_backend_2xx{project:enphoto,elasticbeanstalk:environment-name:enphoto-prod-web}.as_count(), max:aws.elb.httpcode_backend_3xx{project:enphoto,elasticbeanstalk:environment-name:enphoto-prod-web}.as_count(), max:aws.elb.httpcode_backend_4xx{project:enphoto,elasticbeanstalk:environment-name:enphoto-prod-web}.as_count(), max:aws.elb.httpcode_backend_5xx{project:enphoto,elasticbeanstalk:environment-name:enphoto-prod-web}.as_count()"
            }
            request {
                display_type = "bars"
                q            = "max:aws.applicationelb.httpcode_target_2xx{project:enphoto,elasticbeanstalk:environment-name:enphoto-prod-web}.as_count(), max:aws.applicationelb.httpcode_target_3xx{project:enphoto,elasticbeanstalk:environment-name:enphoto-prod-web}.as_count(), max:aws.applicationelb.httpcode_target_4xx{project:enphoto,elasticbeanstalk:environment-name:enphoto-prod-web}.as_count(), max:aws.applicationelb.httpcode_target_5xx{project:enphoto,elasticbeanstalk:environment-name:enphoto-prod-web}.as_count()"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "enphoto-prod-web ELB latency time"

            request {
                display_type = "line"
                q            = "max:aws.elb.latency{project:enphoto,elasticbeanstalk:environment-name:enphoto-prod-web}"
            }
            request {
                display_type = "line"
                q            = "max:aws.applicationelb.target_response_time.average{project:enphoto,elasticbeanstalk:environment-name:enphoto-prod-web}"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "enphoto-prod-web apache processes"

            request {
                display_type = "area"
                q            = "sum:apache.performance.idle_workers{elasticbeanstalk:environment-name:enphoto-prod-web}, sum:apache.performance.busy_workers{elasticbeanstalk:environment-name:enphoto-prod-web}"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "enphoto-prod-web load avg"

            request {
                display_type = "line"
                q            = "sum:system.load.1{elasticbeanstalk:environment-name:enphoto-prod-web}"
            }
            request {
                display_type = "line"
                q            = "sum:system.load.5{elasticbeanstalk:environment-name:enphoto-prod-web}"
            }
            request {
                display_type = "line"
                q            = "sum:system.load.15{elasticbeanstalk:environment-name:enphoto-prod-web}"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "enphoto-prod-web CPU %"

            request {
                display_type = "area"
                q            = "avg:system.cpu.idle{elasticbeanstalk:environment-name:enphoto-prod-web}, avg:system.cpu.system{elasticbeanstalk:environment-name:enphoto-prod-web}, avg:system.cpu.iowait{elasticbeanstalk:environment-name:enphoto-prod-web}, avg:system.cpu.user{elasticbeanstalk:environment-name:enphoto-prod-web}, avg:system.cpu.stolen{elasticbeanstalk:environment-name:enphoto-prod-web}, avg:system.cpu.guest{elasticbeanstalk:environment-name:enphoto-prod-web}"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "enphoto-prod-web mem usage"

            request {
                display_type = "area"
                q            = "avg:system.mem.total{elasticbeanstalk:environment-name:enphoto-prod-web}-avg:system.mem.usable{elasticbeanstalk:environment-name:enphoto-prod-web}"
            }
            request {
                display_type = "line"
                q            = "avg:system.mem.total{elasticbeanstalk:environment-name:enphoto-prod-web}"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "enphoto cloudfront 4xx %"

            request {
                display_type = "bars"
                q            = "avg:aws.cloudfront.4xx_error_rate{distributionid:e1jd6pajlbwj2q}"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "enphoto cloudfront 5xx %"

            request {
                display_type = "line"
                q            = "avg:aws.cloudfront.5xx_error_rate{distributionid:e1jd6pajlbwj2q}"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "enphoto-prod-web network in/out"

            request {
                display_type = "line"
                q            = "top(avg:aws.ec2.network_in{project:enphoto,elasticbeanstalk:environment-name:enphoto-prod-web}, 10, 'mean', 'desc')"
            }
            request {
                display_type = "line"
                q            = "top(avg:aws.ec2.network_out{project:enphoto,elasticbeanstalk:environment-name:enphoto-prod-web}, 10, 'mean', 'desc')"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "enphoto-prod SQS queue count"

            request {
                display_type = "line"
                q            = "max:aws.sqs.approximate_number_of_messages_visible{project:enphoto,queuename:enphoto-prod}, max:aws.sqs.approximate_number_of_messages_not_visible{project:enphoto,queuename:enphoto-prod}"
            }
            request {
                display_type = "line"
                q            = "max:aws.sqs.approximate_number_of_messages_visible{project:enphoto,queuename:enphoto-prod-high}, max:aws.sqs.approximate_number_of_messages_not_visible{project:enphoto,queuename:enphoto-prod-high}"
            }
            request {
                display_type = "line"
                q            = "max:aws.sqs.approximate_number_of_messages_visible{project:enphoto,queuename:enphoto-prod-low}, max:aws.sqs.approximate_number_of_messages_not_visible{project:enphoto,queuename:enphoto-prod-low}"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "SES bounce & complaint %"

            marker {
                display_type = "warning bold"
                label        = "5%"
                value        = "y = 5"
            }
            marker {
                display_type = "error bold"
                label        = "10%"
                value        = "y = 10"
            }

            request {
                display_type = "line"
                q            = "max:aws.ses.reputation_bounce_rate{project:enphoto}, max:aws.ses.reputation_bounce_rate{project:enphoto}*100"
            }
            request {
                display_type = "line"
                q            = "max:aws.ses.reputation_complaint_rate{project:enphoto}, max:aws.ses.reputation_complaint_rate{project:enphoto}*100"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "Avg of aws.rds.free_storage_space over name:enphoto-prod"

            request {
                display_type = "line"
                q            = "avg:aws.rds.free_storage_space{name:enphoto-prod}"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "Avg of aws.ec2.disk_read_ops over *"

            request {
                display_type = "line"
                q            = "avg:aws.ec2.disk_read_ops{*}"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "Avg of aws.ec2.cpuutilization over *"

            request {
                display_type = "line"
                q            = "avg:aws.ec2.cpuutilization{*}"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "enphoto-prod-lambda-trimming-errors"

            request {
                display_type = "bars"
                q            = "avg:aws.lambda.errors{project:enphoto,functionname:enphoto-prod-trimming}.as_count()"
            }
        }
    }
    widget {
        layout = {}

        timeseries_definition {
            show_legend = false
            time        = {}
            title       = "Avg of aws.rds.free_storage_space over *"

            request {
                display_type = "line"
                q            = "avg:aws.rds.free_storage_space{*}"
            }
        }
    }
}
