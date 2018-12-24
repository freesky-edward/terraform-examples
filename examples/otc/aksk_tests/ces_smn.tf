resource "opentelekomcloud_smn_topic_v2" "example_topic" {
  name		      = "example_topic"
  display_name    = "This is an example topic"
}

resource "opentelekomcloud_smn_subscription_v2" "example_subscription" {
  topic_urn       = "${opentelekomcloud_smn_topic_v2.example_topic.id}"
  endpoint        = "${var.smn_email}"
  protocol        = "email"
  remark          = "O&M"
}

resource "opentelekomcloud_ces_alarmrule" "example_alarm_rule" {
  "alarm_name" = "example_alarm_rule"
  "metric" {
    "namespace" = "SYS.ECS"
    "metric_name" = "network_outgoing_bytes_rate_inband"
    "dimensions" {
        "name" = "${opentelekomcloud_compute_instance_v2.server_example.name}"
        "value" = "${opentelekomcloud_compute_instance_v2.server_example.id}"
    }
  }
  "condition"  {
    "period" = 300
    "filter" = "average"
    "comparison_operator" = ">"
    "value" = 6
    "unit" = "B/s"
    "count" = 1
  }
  "alarm_actions" {
    "type" = "notification"
    "notification_list" = [
      "${opentelekomcloud_smn_topic_v2.example_topic.id}"
    ]
  }
}
