module "cloudflare_record" {
  source = "github.com/Ujstor/terraform-hetzner-modules//modules/network/cloudflare_record?ref=v0.0.3"

  cloudflare_record = {
    kube_api = {
      zone_id = var.cloudflare_zone_id
      name    = "api.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    argo_cd = {
      zone_id = var.cloudflare_zone_id
      name    = "argocd.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitea = {
      zone_id = var.cloudflare_zone_id
      name    = "gitea.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    valut = {
      zone_id = var.cloudflare_zone_id
      name    = "vault.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    portfolio = {
      zone_id = var.cloudflare_zone_id
      name    = "portfolio"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    working-hours = {
      zone_id = var.cloudflare_zone_id
      name    = "working-hours"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    todo = {
      zone_id = var.cloudflare_zone_id
      name    = "todo"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    notes = {
      zone_id = var.cloudflare_zone_id
      name    = "notes"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    analytics = {
      zone_id = var.cloudflare_zone_id
      name    = "plausible-analytics"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    wordpress = {
      zone_id = var.cloudflare_zone_id
      name    = "wordpress"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    uptimekuma = {
      zone_id = var.cloudflare_zone_id
      name    = "uptime.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    harbor = {
      zone_id = var.cloudflare_zone_id
      name    = "harbor.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-gitlab = {
      zone_id = var.cloudflare_zone_id
      name    = "gitlab.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-registry = {
      zone_id = var.cloudflare_zone_id
      name    = "registry.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-minio = {
      zone_id = var.cloudflare_zone_id
      name    = "minio.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-kas = {
      zone_id = var.cloudflare_zone_id
      name    = "kas.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    gitlab-pages = {
      zone_id = var.cloudflare_zone_id
      name    = "pages.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    s3 = {
      zone_id = var.cloudflare_zone_id
      name    = "s3.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
    s3-consile = {
      zone_id = var.cloudflare_zone_id
      name    = "s3.console.k3s1"
      content = module.k3s1_server.server_info.k3s1-server.ip
      type    = "A"
      ttl     = 60
      proxied = false
    }
  }
  depends_on = [module.k3s1_server]
}
