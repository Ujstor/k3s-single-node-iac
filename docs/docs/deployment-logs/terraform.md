```bash
terraform init
Initializing the backend...
Initializing modules...
Downloading git::https://github.com/Ujstor/terraform-hetzner-modules.git?ref=v0.0.8 for cloudflare_record...
- cloudflare_record in .terraform/modules/cloudflare_record/modules/network/cloudflare_record
Downloading git::https://github.com/Ujstor/terraform-hetzner-modules.git?ref=v0.0.8 for floating_ip...
- floating_ip in .terraform/modules/floating_ip/modules/network/floating_ip
Downloading git::https://github.com/Ujstor/terraform-hetzner-modules.git?ref=v0.0.8 for k3s_server...
- k3s_server in .terraform/modules/k3s_server/modules/server
Downloading git::https://github.com/Ujstor/terraform-hetzner-modules.git?ref=v0.0.8 for ssh_key_k3s...
- ssh_key_k3s in .terraform/modules/ssh_key_k3s/modules/ssh_key
Initializing provider plugins...
- Finding hetznercloud/hcloud versions matching "~> 1.47"...
- Finding hashicorp/tls versions matching "~> 4.0"...
- Finding cloudflare/cloudflare versions matching "~> 4.37"...
- Installing hetznercloud/hcloud v1.49.1...
- Installed hetznercloud/hcloud v1.49.1 (signed by a HashiCorp partner, key ID 5219EACB3A77198B)
- Installing hashicorp/tls v4.0.6...
- Installed hashicorp/tls v4.0.6 (signed by HashiCorp)
- Installing cloudflare/cloudflare v4.48.0...
- Installed cloudflare/cloudflare v4.48.0 (self-signed, key ID C76001609EE3B136)
Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html
Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
```bash
 terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.cloudflare_record.cloudflare_record.domain_recorda["kube_api"] will be created
  + resource "cloudflare_record" "domain_recorda" {
      + allow_overwrite = false
      + content         = (known after apply)
      + created_on      = (known after apply)
      + hostname        = (known after apply)
      + id              = (known after apply)
      + metadata        = (known after apply)
      + modified_on     = (known after apply)
      + name            = "api.k3s"
      + proxiable       = (known after apply)
      + proxied         = false
      + ttl             = 60
      + type            = "A"
      + value           = (known after apply)
      + zone_id         = "954d9bc1391a15cc29a993894cbf65fb"
    }

  # module.cloudflare_record.cloudflare_record.domain_recorda["mail"] will be created
  + resource "cloudflare_record" "domain_recorda" {
      + allow_overwrite = false
      + content         = (known after apply)
      + created_on      = (known after apply)
      + hostname        = (known after apply)
      + id              = (known after apply)
      + metadata        = (known after apply)
      + modified_on     = (known after apply)
      + name            = "mail.k3s"
      + proxiable       = (known after apply)
      + proxied         = false
      + ttl             = 60
      + type            = "A"
      + value           = (known after apply)
      + zone_id         = "954d9bc1391a15cc29a993894cbf65fb"
    }

  # module.cloudflare_record.cloudflare_record.domain_recorda["mail-dkms"] will be created
  + resource "cloudflare_record" "domain_recorda" {
      + allow_overwrite = false
      + content         = "add config"
      + created_on      = (known after apply)
      + hostname        = (known after apply)
      + id              = (known after apply)
      + metadata        = (known after apply)
      + modified_on     = (known after apply)
      + name            = "mail.k3s_domainkey.ujstor.com"
      + proxiable       = (known after apply)
      + ttl             = 1
      + type            = "TXT"
      + value           = (known after apply)
      + zone_id         = "954d9bc1391a15cc29a993894cbf65fb"
    }

  # module.cloudflare_record.cloudflare_record.domain_recorda["mx"] will be created
  + resource "cloudflare_record" "domain_recorda" {
      + allow_overwrite = false
      + content         = "mail.k3s.ujstor.com"
      + created_on      = (known after apply)
      + hostname        = (known after apply)
      + id              = (known after apply)
      + metadata        = (known after apply)
      + modified_on     = (known after apply)
      + name            = "@"
      + priority        = 10
      + proxiable       = (known after apply)
      + ttl             = (known after apply)
      + type            = "MX"
      + value           = (known after apply)
      + zone_id         = "954d9bc1391a15cc29a993894cbf65fb"
    }

  # module.cloudflare_record.cloudflare_record.domain_recorda["wildcard_k3s"] will be created
  + resource "cloudflare_record" "domain_recorda" {
      + allow_overwrite = false
      + content         = (known after apply)
      + created_on      = (known after apply)
      + hostname        = (known after apply)
      + id              = (known after apply)
      + metadata        = (known after apply)
      + modified_on     = (known after apply)
      + name            = "*.k3s"
      + proxiable       = (known after apply)
      + proxied         = false
      + ttl             = 60
      + type            = "A"
      + value           = (known after apply)
      + zone_id         = "954d9bc1391a15cc29a993894cbf65fb"
    }

  # module.floating_ip.hcloud_floating_ip.main["ip-1"] will be created
  + resource "hcloud_floating_ip" "main" {
      + delete_protection = false
      + home_location     = "nbg1"
      + id                = (known after apply)
      + ip_address        = (known after apply)
      + ip_network        = (known after apply)
      + name              = (known after apply)
      + server_id         = (known after apply)
      + type              = "ipv4"
    }

  # module.floating_ip.hcloud_floating_ip_assignment.main["ip-1"] will be created
  + resource "hcloud_floating_ip_assignment" "main" {
      + floating_ip_id = (known after apply)
      + id             = (known after apply)
      + server_id      = (known after apply)
    }

  # module.k3s_server.hcloud_server.server["k3s-server"] will be created
  + resource "hcloud_server" "server" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = (known after apply)
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "debian-12"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + location                   = "nbg1"
      + name                       = "k3s-server"
      + primary_disk_size          = (known after apply)
      + rebuild_protection         = false
      + server_type                = "cx42"
      + shutdown_before_deletion   = false
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = true
          + ipv6         = (known after apply)
          + ipv6_enabled = false
        }
    }

  # module.ssh_key_k3s.hcloud_ssh_key.default will be created
  + resource "hcloud_ssh_key" "default" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + labels      = {}
      + name        = "k3s_hetzner_key"
      + public_key  = (known after apply)
    }

  # module.ssh_key_k3s.tls_private_key.ssh_key will be created
  + resource "tls_private_key" "ssh_key" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

Plan: 10 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + floating_ip_info = {
      + ip-1 = {
          + ip = (known after apply)
        }
    }
  + server_info      = {
      + k3s-server = {
          + id       = (known after apply)
          + ip       = (known after apply)
          + location = "nbg1"
          + status   = (known after apply)
        }
    }

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.ssh_key_k3s.tls_private_key.ssh_key: Creating...
module.ssh_key_k3s.tls_private_key.ssh_key: Creation complete after 1s [id=69cd99907b9068f36cd9e0c44e5a67c4b952b7ad]
module.ssh_key_k3s.hcloud_ssh_key.default: Creating...
module.ssh_key_k3s.hcloud_ssh_key.default: Provisioning with 'local-exec'...
module.ssh_key_k3s.hcloud_ssh_key.default (local-exec): (output suppressed due to sensitive value in config)
module.ssh_key_k3s.hcloud_ssh_key.default: Creation complete after 0s [id=25750490]
module.k3s_server.hcloud_server.server["k3s-server"]: Creating...
module.k3s_server.hcloud_server.server["k3s-server"]: Still creating... [10s elapsed]
module.k3s_server.hcloud_server.server["k3s-server"]: Creation complete after 18s [id=57930612]
module.floating_ip.hcloud_floating_ip.main["ip-1"]: Creating...
module.floating_ip.hcloud_floating_ip.main["ip-1"]: Creation complete after 1s [id=77602715]
module.floating_ip.hcloud_floating_ip_assignment.main["ip-1"]: Creating...
module.cloudflare_record.cloudflare_record.domain_recorda["kube_api"]: Creating...
module.cloudflare_record.cloudflare_record.domain_recorda["mail"]: Creating...
module.cloudflare_record.cloudflare_record.domain_recorda["mail-dkms"]: Creating...
module.cloudflare_record.cloudflare_record.domain_recorda["mx"]: Creating...
module.cloudflare_record.cloudflare_record.domain_recorda["wildcard_k3s"]: Creating...
module.floating_ip.hcloud_floating_ip_assignment.main["ip-1"]: Creation complete after 0s [id=77602715]
module.cloudflare_record.cloudflare_record.domain_recorda["mail"]: Creation complete after 2s [id=166576bddf808a910eabcd9e9f415837]
module.cloudflare_record.cloudflare_record.domain_recorda["kube_api"]: Creation complete after 2s [id=9dca7e42dcb89a0e2412ae81d337649e]
module.cloudflare_record.cloudflare_record.domain_recorda["mail-dkms"]: Creation complete after 2s [id=989af06dec3500740fa90f2eea3af768]
module.cloudflare_record.cloudflare_record.domain_recorda["mx"]: Creation complete after 2s [id=96f55a5cc4d326552a724ce04424941a]
module.cloudflare_record.cloudflare_record.domain_recorda["wildcard_k3s"]: Creation complete after 3s [id=90e768bde523966ee8e692a1892bcf76]

Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

Outputs:

floating_ip_info = {
  "ip-1" = {
    "ip" = "116.202.185.83"
  }
}
server_info = {
  "k3s-server" = {
    "id" = "57930612"
    "ip" = "159.69.83.103"
    "location" = "nbg1"
    "status" = "running"
  }
}
```
