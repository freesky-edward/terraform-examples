resource "opentelekomcloud_networking_router_v2" "router" {
  name             = "router_example"
  admin_state_up   = "true"
}

resource "opentelekomcloud_networking_network_v2" "network" {
  name           = "network_example"
  admin_state_up = "true"
}

resource "opentelekomcloud_networking_subnet_v2" "subnet" {
  name            = "subnet_example"
  network_id      = "${opentelekomcloud_networking_network_v2.network.id}"
  cidr            = "${var.network_cidr}"
  ip_version      = 4
  dns_nameservers = ["100.125.1.250", "114.114.115.115"]
}

resource "opentelekomcloud_networking_router_interface_v2" "interface" {
  router_id = "${opentelekomcloud_networking_router_v2.router.id}"
  subnet_id = "${opentelekomcloud_networking_subnet_v2.subnet.id}"
}
