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
-v ./inventory.yml:/ansible/inventory.yml \
-v ./hetzner_infra/.ssh/k3s_hetzner_key:/secrets/ssh_key \
-v ./hetzner_infra/.ssh/k3s_hetzner_key.pub:/secrets/ssh_key.pub \
ansible-k3s

ansible-playbook playbook_k3s_deploy.yml

cat kubeconfig
```

or use the [prebuilt](https://hub.docker.com/repository/docker/ujstor/ansible-k3s-deploy/general) image:

```bash
docker run --rm -it \
-v ./inventory.yml:/ansible/inventory.yml \
-v ./hetzner_infra/.ssh/k3s_hetzner_key:/secrets/ssh_key \
-v ./hetzner_infra/.ssh/k3s_hetzner_key.pub:/secrets/ssh_key.pub \
ansible-k3s-deploy:0.0.2
```
