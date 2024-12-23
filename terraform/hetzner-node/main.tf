module "ssh_key_k3s" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/ssh_key?ref=v0.0.8"

  ssh_key_name = "k3s_hetzner_key"
  ssh_key_path = ".ssh" #create dir before appling tf config if you use custom paths for ssh keys
}

module "k3s_server" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/server?ref=v0.0.8"

  server_config = {
    k3s-server = {
      location     = "nbg1"
      server_type  = "cx42"
      ipv6_enabled = false
    }
  }

  hcloud_ssh_key_id = [module.ssh_key_k3s.hcloud_ssh_key_id]

  depends_on = [module.ssh_key_k3s]
}

module "floating_ip" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/network/floating_ip?ref=v0.0.8"

  floating_ip_config = {
    ip-1 = {
      server_id       = module.k3s_server.server_info.k3s-server.id
      server_location = module.k3s_server.server_info.k3s-server.location
    }
  }
  depends_on = [module.k3s_server]
}
