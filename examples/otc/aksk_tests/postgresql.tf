data "opentelekomcloud_rds_flavors_v1" "flavor" {
    region = "${var.region}"
    datastore_name = "PostgreSQL"
    datastore_version = "9.5.5"
    speccode = "rds.pg.s1.large.ha"
}

resource "opentelekomcloud_compute_secgroup_v2" "example_sg_db" {
  name        = "example_sg_db"
  description = "Rds Security Group"
}

resource "opentelekomcloud_rds_instance_v1" "example_postgresql" {
  name = "example_postgresql"
  datastore {
    type = "PostgreSQL"
    version = "9.5.5"
  }
  flavorref = "${data.opentelekomcloud_rds_flavors_v1.flavor.id}"
  volume {
    type = "COMMON"
    size = 200
  }
  region = "${var.region}"
  availabilityzone = "${var.az}"
  vpc = "${opentelekomcloud_networking_router_v2.router.id}"
  nics {
    subnetid = "${opentelekomcloud_networking_network_v2.network.id}"
  }
  securitygroup {
    id = "${opentelekomcloud_compute_secgroup_v2.example_sg_db.id}"
  }
  dbport = "${var.postgre_port}"
  backupstrategy = {
    starttime = "04:00:00"
    keepdays = 4
  }
  dbrtpd = "${var.db_psw}"
  ha = {
    enable = true
    replicationmode = "async"
  }
}
