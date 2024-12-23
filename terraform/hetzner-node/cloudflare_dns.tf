module "cloudflare_record" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/network/cloudflare_record?ref=v0.0.8"

  cloudflare_record = {
    kube_api = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s"
      content = module.k3s_server.server_info.k3s-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    wildcard_k3s = {
      zone_id = var.cloudflare_zone_id
      name    = "*.k3s"
      content = module.k3s_server.server_info.k3s-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    mx = {
      zone_id  = var.cloudflare_zone_id
      name     = "@"
      content  = "mail.k3s.ujstor.com"
      type     = "MX"
      priority = 10
    }
    mail = {
      zone_id = var.cloudflare_zone_id
      name    = "mail.k3s"
      content = module.floating_ip.floating_ip_status.ip-1.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    mail-dkms = {
      zone_id = var.cloudflare_zone_id
      name    = "mail.k3s_domainkey.ujstor.com"
      content = "add config"
      type    = "TXT"
      ttl     = 1
    }
  }
  depends_on = [module.k3s_server]
}
