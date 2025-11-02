resource "openstack_networking_floatingip_v2" "fip" {
  pool = var.public_network
}


