resource "openstack_networking_network_v2" "test_network" {
  name = "test-network"
}

resource "openstack_networking_subnet_v2" "test_subnet" {
  name       = "test-subnet"
  network_id = openstack_networking_network_v2.test_network.id
  cidr       = var.network_cidr
  ip_version = 4
  gateway_ip = "192.168.10.1"
  enable_dhcp = true
}

resource "openstack_networking_router_v2" "test_router" {
  name                = "test-router"
  external_network_id = var.public_network_id
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.test_router.id
  subnet_id = openstack_networking_subnet_v2.test_subnet.id
}
