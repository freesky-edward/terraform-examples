resource "opentelekomcloud_dms_queue_v1" "example_queue" {
  name  = "example_queue"
  description  = "test create dms queue"
  queue_mode  = "FIFO"
  redrive_policy  = "enable"
  max_consume_count = 80
}

resource "opentelekomcloud_dms_group_v1" "example_queue_group" {
  name = "example_queue_group"
  queue_id = "${opentelekomcloud_dms_queue_v1.example_queue.id}"
}
