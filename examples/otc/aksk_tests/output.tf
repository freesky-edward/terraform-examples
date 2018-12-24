output "instance_address" {
    value = "${opentelekomcloud_compute_instance_v2.server_example.access_ip_v4}"
}


output "lb_address" {
   value = "${opentelekomcloud_lb_loadbalancer_v2.example_lb.vip_address}"
}

output "lb_port1" {
   value = "${opentelekomcloud_lb_listener_v2.example_listener.protocol_port}"
}


output "db_address" {
   value = "${opentelekomcloud_rds_instance_v1.example_postgresql.hostname}"
}

output "db_port" {
   value = "${opentelekomcloud_rds_instance_v1.example_postgresql.dbport}"
}
