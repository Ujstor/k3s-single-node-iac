module "cloudflare_record" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/network/cloudflare_record?ref=v0.0.6"

  cloudflare_record = {
    kube_api = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    wildcard_k3s1 = {
      zone_id = var.cloudflare_zone_id
      name    = "*.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    wildcard_domain = {
      zone_id = var.cloudflare_zone_id
      name    = "*"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
  }
  depends_on = [module.k3s1_server]
}
