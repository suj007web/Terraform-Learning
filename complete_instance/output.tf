output "instance_ip" {
  value = openstack_networking_floatingip_associate_v2.fip_assoc.floating_ip
}
