resource "opentelekomcloud_lb_loadbalancer_v2" "example_lb" {
  name = "example_lb"
  region      = "${var.region}"
  vip_subnet_id = "${opentelekomcloud_networking_subnet_v2.subnet.id}"
  depends_on = ["opentelekomcloud_networking_router_interface_v2.interface"]
}

resource "opentelekomcloud_lb_listener_v2" "example_listener" {
  name = "example_listener"
  region      = "${var.region}"
  protocol        = "${var.lb_protocol}"
  protocol_port   = "${var.lb_port}"
  loadbalancer_id = "${opentelekomcloud_lb_loadbalancer_v2.example_lb.id}"
}

resource "opentelekomcloud_lb_pool_v2" "example_pool" {
  name = "example_pool"
  region      = "${var.region}"
  protocol    = "${var.lb_protocol}"
  lb_method   = "${var.lb_method}"
  listener_id = "${opentelekomcloud_lb_listener_v2.example_listener.id}"

  persistence {
    type        = "APP_COOKIE"
    cookie_name = "testCookie"
  }
}

resource "opentelekomcloud_lb_member_v2" "example_member_1" {
  name = "example_member_1"
  region      = "${var.region}"
  pool_id = "${opentelekomcloud_lb_pool_v2.example_pool.id}"
  subnet_id = "${opentelekomcloud_networking_subnet_v2.subnet.id}"
  address       = "${opentelekomcloud_compute_instance_v2.server_example.access_ip_v4}"
  protocol_port = "${var.lb_port}"
  depends_on = ["opentelekomcloud_networking_router_interface_v2.interface"]
}

resource "opentelekomcloud_lb_monitor_v2" "example_monitor" {
  region      = "eu-de"
  pool_id     = "${opentelekomcloud_lb_pool_v2.example_pool.id}"
  type        = "PING"
  delay       = 20
  timeout     = 10
  max_retries = 5
}
