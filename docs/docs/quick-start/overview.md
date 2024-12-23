First step is to create API key in the Hetzner Cloud Console and Cloudflare API key in the Cloudflare dashboard for domain management.
Import them as secrets in ./terraform/hetzner_node/.auto.tfvars file:

```tfvars
hcloud_token = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
cloudflare_api_token = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
cloudflare_zone_id   = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

## Order of Execution

We need to use Terraform, Ansible, Helm and kubectl to deploy the infrastructure:

1. We are creating SSH keys and node in Hetzner Cloud with Terraform
2. Ansible will deploy K3s
3. We will deploy Cilium and ArgoCD
4. Apply [App of Apps](https://github.com/Ujstor/k3s-single-node-iac/blob/master/helm/aoa.yaml) to finish the setup and bootstrap

## Helm charts configuration

The Helm charts are configured in values.yaml and are imported as dependencies from a repository. They contain my personal configuration, but you can modify them to suit your needs.
Do not blindly apply them - check every configuration.

## Project tree

```bash
```
