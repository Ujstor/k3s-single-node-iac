module "ssh_key_k3s4" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/ssh_key?ref=v0.0.6"

  ssh_key_name = "k3s4_hetzner_key"
  ssh_key_path = ".ssh" #create dir before appling tf config if you use custom paths for ssh keys
}

module "k3s4_server" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/server?ref=v0.0.6"

  server_config = {
    k3s4-server = {
      location     = "nbg1"
      server_type  = "cx42"
      ipv6_enabled = false
    }
  }

  hcloud_ssh_key_id = [module.ssh_key_k3s4.hcloud_ssh_key_id]

  depends_on = [module.ssh_key_k3s4]
}
