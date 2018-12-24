resource "opentelekomcloud_compute_instance_v2" "server_example" {
  region = "${var.region}"
  availability_zone = "${var.az}"
  name            = "${var.instance_name}"
  image_id      = "${data.opentelekomcloud_images_image_v2.ubuntu.id}"
  flavor_name     = "${var.flavor_name}"
  security_groups = ["${opentelekomcloud_networking_secgroup_v2.sg_example.name}"]

  network {
    uuid = "${opentelekomcloud_networking_network_v2.network.id}"
  }
  depends_on = ["opentelekomcloud_networking_router_interface_v2.interface"]
}
