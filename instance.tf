
resource "openstack_compute_instance_v2" "my_instance" {
  name            = "my-first-instance"
  image_id      = var.image_id      
  flavor_name     = var.flavor_name   
  key_pair        = "my-key"        
  security_groups = ["default"]

  network {
    name = var.network_name            
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

output "instance_ip" {
  value = openstack_compute_instance_v2.my_instance.access_ip_v4
}

