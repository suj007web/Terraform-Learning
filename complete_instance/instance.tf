resource "openstack_compute_instance_v2" "test_instance" {
  name            = "test-instance"
  image_id        = var.image_id
  flavor_name     = var.flavor_name
  key_pair        = openstack_compute_keypair_v2.test_keypair.name
  security_groups = [openstack_networking_secgroup_v2.test_secgroup.name]
  user_data      = file("./install_nginx.sh")

  network {
    uuid = openstack_networking_network_v2.test_network.id
  }
    block_device {
    uuid                  = var.image_id
    source_type           = "image"
    destination_type      = "volume"
    volume_size           = 20          
    boot_index            = 0
    delete_on_termination = true
  }
}

data "openstack_networking_port_v2" "vm_port" {
  device_id  = openstack_compute_instance_v2.test_instance.id
  network_id = openstack_networking_network_v2.test_network.id
}

resource "openstack_networking_floatingip_associate_v2" "fip_assoc" {
  floating_ip = openstack_networking_floatingip_v2.fip.address
  port_id     = data.openstack_networking_port_v2.vm_port.id
}