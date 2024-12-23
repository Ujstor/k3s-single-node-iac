# K3S Single Node IaC

Minimal k3s single node deployment on Hetzner Cloud with Terraform and Ansible managed with ArgoCD.

![cluser](./docs/docs/public/01_infra_diagram_k3s_single.png)

K3s is stripped down to minimal components. The only components we have are CoreDNS, local-path-provisioner, and metrics-server. Everything else is disabled and configured with custom Helm charts.

The clusters will be automatically bootstrapped and managed with [ArgoCD](https://argo-cd.readthedocs.io/en/stable/).

## Prerequisites

Before you begin, ensure you have the following:

- [Hetzner Cloud account](https://hetzner.cloud/?ref=Ix9xCKNxJriM) (20$ free credits)
- [Terraform](https://www.terraform.io/downloads.html)
- [Helm](https://helm.sh/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
- [K9s](https://k9scli.io/) (optional but recommended)

Helm charts and Terraform modules are custom-made with the intention to be reusable and reconfigurable:

- [Helm Charts System](https://github.com/Ujstor/helm-charts-system)
- [Helm Charts Apps](https://github.com/Ujstor/helm-charts-apps)
- [Helm Charts Github Apps](https://github.com/Ujstor/helm-charts-github-apps)
- [Terraform Hetzner Modules](https://github.com/Ujstor/terraform-hetzner-modules)


[Docs](https://ujstor.github.io/k3s-single-node-iac/) are work in progress.
