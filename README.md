# K3S Single Node IaC

Minimal k3s single node deployment on Hetzner Cloud with Terraform and Ansible.

## Terraform

```bash
cd hetzner_infra

terraform init
terraform apply
```

## Ansible

```bash
docker build -t ansible-k3s ./ansible

docker run --rm -it \
    -v $(pwd)/inventory.yml:/config/inventory.yml \
    -v $(pwd)/hetzner_infra/.ssh/k3s_hetzner_key:/secrets/ssh_key \
    -v $(pwd)/hetzner_infra/.ssh/k3s_hetzner_key.pub:/secrets/ssh_key.pub \
    ansible-k3s

ansible-playbook playbook_k3s_deploy.yml

cat kubeconfig
```

or use the [prebuilt](https://hub.docker.com/repository/docker/ujstor/ansible-k3s-deploy/general) image.

## Helm

### Install Cilium in the `kube-system` namespace:

```bash
cd helm/system/cilium
helm install cilium . -n kube-system
```

### Install Ingress-nginx in the `ingress-nginx` namespace:

```bash
kubectl create namespace ingress-nginx
cd helm/system/ingress-nginx
helm install system-ingress-nginx . -n ingress-nginx
```

### Install Argo CD:
```bash
kubectl create namespace gitops
cd helm/system/argo-cd
helm install argocd . -n gitops
```

### Apply `aoa.yaml` in the `gitops` namespace:
```bash
cd helm
kubectl apply -f aoa.yaml -n gitops
``````

The cluster will be automatically bootstrapped.
