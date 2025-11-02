resource "openstack_compute_keypair_v2" "test_keypair" {
  name       = "new-keypair"
  public_key = file("./tf-sujal.pub")
}
