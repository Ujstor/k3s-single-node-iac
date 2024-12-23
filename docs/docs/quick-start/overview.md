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
[4.0K]  ./
├── [4.0K]  ansible/
│   ├── [4.0K]  roles/
│   │   └── [4.0K]  common/
│   │       ├── [4.0K]  defaults/
│   │       ├── [4.0K]  tasks/
│   │       └── [4.0K]  templates/
│   ├── [ 239]  ansible.cfg
│   ├── [ 459]  Dockerfile
│   ├── [1.3K]  k3s_deploy.yml
│   ├── [ 207]  k3s_remove.yml
│   └── [ 169]  requirements.yml
├── [4.0K]  helm/
│   ├── [4.0K]  app-of-apps/
│   │   ├── [ 509]  100_system_cilium.yaml
│   │   ├── [ 694]  110_system_metallb_operator.yaml
│   │   ├── [ 698]  120_system_metallb_config.yaml
│   │   ├── [ 720]  150_system_ingress_nginx.yaml
│   │   ├── [ 723]  200_system_cert_manager.yaml
│   │   ├── [ 699]  300_system_cluster_issuer.yaml
│   │   ├── [ 682]  400_system_postgres_operator.yaml
│   │   ├── [ 641]  410_system_minio_operator.yaml
│   │   ├── [ 645]  420_system_gitlab_operator.yaml
│   │   ├── [ 649]  500_system_external_secrets.yaml
│   │   ├── [ 609]  600_system_argocd.yaml
│   │   ├── [ 689]  700_system_prometheus_grafana.yaml
│   │   ├── [ 601]  900_app_gitea.yaml
│   │   ├── [ 657]  910_app_github_readme_stats_api.yaml
│   │   ├── [ 616]  910_app_portfolio.yaml
│   │   ├── [ 625]  920_app_mailserver.yaml
│   │   ├── [ 629]  925_app_streamlit_wh.yaml
│   │   ├── [ 629]  930_app_todo_go_htmx.yaml
│   │   ├── [ 613]  935_app_fastapi.yaml
│   │   ├── [ 625]  940_app_notes_flask.yaml
│   │   ├── [ 625]  945_app_todo_django.yaml
│   │   ├── [ 769]  950_app_plausible_analytics.yaml
│   │   ├── [ 625]  955_app_uptime_kuma.yaml
│   │   ├── [ 626]  960_app_wordpress_ds.yaml
│   │   ├── [ 822]  970_app_harbor.yaml
│   │   ├── [ 605]  980_app_gitlab.yaml
│   │   ├── [ 859]  990_app_s3_storage.yaml
│   │   └── [ 550]  AppProject.yaml
│   ├── [4.0K]  apps/
│   │   ├── [4.0K]  fastapi/
│   │   ├── [4.0K]  gitea/
│   │   ├── [4.0K]  github-readme-stats/
│   │   ├── [4.0K]  gitlab/
│   │   ├── [4.0K]  harbor/
│   │   ├── [4.0K]  mailserver/
│   │   ├── [4.0K]  notes-flask/
│   │   ├── [4.0K]  plausible-analytics/
│   │   ├── [4.0K]  portfolio/
│   │   ├── [4.0K]  s3-storage/
│   │   ├── [4.0K]  streamlit-wh/
│   │   ├── [4.0K]  todo-django/
│   │   ├── [4.0K]  todo-go-htmx/
│   │   ├── [4.0K]  uptime-kuma/
│   │   └── [4.0K]  wordpress-ds/
│   ├── [4.0K]  system/
│   │   ├── [4.0K]  argocd/
│   │   ├── [4.0K]  cert-manager/
│   │   ├── [4.0K]  cilium/
│   │   ├── [4.0K]  cluster-issuer/
│   │   ├── [4.0K]  external-secrets/
│   │   ├── [4.0K]  gitlab-operator/
│   │   ├── [4.0K]  ingress-nginx/
│   │   ├── [4.0K]  metallb-config/
│   │   ├── [4.0K]  metallb-operator/
│   │   ├── [4.0K]  minio-operator/
│   │   ├── [4.0K]  postgres-operator/
│   │   └── [4.0K]  prometheus-grafana/
│   └── [ 379]  aoa.yaml
├── [4.0K]  terraform/
│   ├── [4.0K]  hetzner-node/
│   │   ├── [1.1K]  cloudflare_dns.tf
│   │   ├── [ 934]  main.tf
│   │   ├── [ 144]  output.tf
│   │   ├── [ 26K]  terraform.tfstate
│   │   ├── [ 911]  terrafrom.tf
│   │   └── [ 329]  variables.tf
│   ├── [4.0K]  s3-kubeconfig-backup/
│   │   ├── [ 649]  main.tf
│   │   ├── [ 120]  outputs.tf
│   │   ├── [ 879]  terraform.tf
│   │   └── [ 159]  variables.tf
│   ├── [4.0K]  s3-ssh-keys-backup/
│   │   ├── [ 614]  main.tf
│   │   ├── [ 120]  outputs.tf
│   │   ├── [ 880]  terraform.tf
│   │   └── [ 150]  variables.tf
│   └── [4.0K]  s3-tf-state/
│       ├── [ 254]  main.tf
│       ├── [ 120]  outputs.tf
│       ├── [ 426]  terraform.tf
│       └── [ 151]  variables.tf
├── [ 171]  docker-config.yml
├── [2.6K]  docker_tag.sh*
├── [ 505]  inventory.yml
├── [1.0K]  LICENSE
├── [1.0K]  Makefile
└── [1.3K]  README.md
```
