resource "opentelekomcloud_networking_secgroup_v2" "sg_example" {
  name        = "${var.sg_name}"
  description = "security group for test"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "sg_rule_ftp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "192.168.10.0/24"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.sg_example.id}"
  lifecycle {
    create_before_destroy = true
  }
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "sg_rule_http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "192.168.10.0/24"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.sg_example.id}"
  #lifecycle {
  #  prevent_destroy = true
  #}
}
