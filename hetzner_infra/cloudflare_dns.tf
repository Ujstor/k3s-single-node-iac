module "cloudflare_record" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/network/cloudflare_record?ref=v0.0.3"

  cloudflare_record = {
    kube_api = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s"
      content = module.k3s_server.server_info.k3s-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    argo_cd = {
      zone_id = var.cloudflare_zone_id
      name    = "argocd.k3s"
      content = module.k3s_server.server_info.k3s-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitea = {
      zone_id = var.cloudflare_zone_id
      name    = "gitea.k3s"
      content = module.k3s_server.server_info.k3s-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    valut = {
      zone_id = var.cloudflare_zone_id
      name    = "vault.k3s"
      content = module.k3s_server.server_info.k3s-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    portfolio = {
      zone_id = var.cloudflare_zone_id
      name    = "portfolio"
      content = module.k3s_server.server_info.k3s-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    working-hours = {
      zone_id = var.cloudflare_zone_id
      name    = "working-hours"
      content = module.k3s_server.server_info.k3s-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
  }
  depends_on = [module.k3s_server]
}
