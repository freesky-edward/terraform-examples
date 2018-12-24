resource "opentelekomcloud_dns_zone_v2" "example_zone" {
  name = "test.example.com."
  email = "helo@example.com"
  description = "An example zone"
  ttl = 3000
  type = "private"
  router = [
    {
	router_region = "${var.region}"
	router_id = "${opentelekomcloud_networking_router_v2.router.id}"
    }]
}


resource "opentelekomcloud_dns_recordset_v2" "example_com" {
  zone_id = "${opentelekomcloud_dns_zone_v2.example_zone.id}"
  name = "1.test.example.com."
  description = "An example record set"
  ttl = 3000
  type = "A"
  records = ["10.0.0.1"]
}
