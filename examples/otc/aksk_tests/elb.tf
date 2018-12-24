resource "huaweicloud_elb_loadbalancer" "example_elb" {
  name = "example_elb"
  description = "This is an example for elb"
  type = "External"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.sg_example.id}"
  vpc_id = "${opentelekomcloud_networking_router_v2.router.id}"
  vip_subnet_id = "${opentelekomcloud_networking_network_v2.network.id}"
  admin_state_up = 1
  bandwidth = 5
}


resource "huaweicloud_elb_listener" "example_listener" {
  name = "example_listener"
  protocol        = "TCP"
  port   = 22
  backend_protocol = "TCP"
  backend_port = 80
  lb_algorithm = "roundrobin"
  loadbalancer_id = "${huaweicloud_elb_loadbalancer.example_elb.id}"
}

resource "huaweicloud_elb_healthcheck" "example_health" {
  listener_id = "${huaweicloud_elb_listener.example_listener.id}"
  healthcheck_protocol = "HTTP"
  healthy_threshold = 5
  healthcheck_timeout = 25
  healthcheck_interval = 3
  healthcheck_uri = "/"
  timeouts {
    create = "5m"
    update = "5m"
    delete = "5m"
  }
}

resource "huaweicloud_elb_backendecs" "example_backend" {
  private_address = "${opentelekomcloud_compute_instance_v2.server_example.access_ip_v4}"
  listener_id = "${huaweicloud_elb_listener.example_listener.id}"
  server_id = "${opentelekomcloud_compute_instance_v2.server_example.id}"
}


