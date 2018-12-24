data "opentelekomcloud_images_image_v2" "ubuntu" {
  name = "${var.image_name}"
  most_recent = true
}
