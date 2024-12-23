Ansible is not listed in requirements for a reason. We have encapsulated Ansible configuration and run it in a Docker container.

From the project root, run the following command to build the Docker image:

```bash
docker build -t  ansible-k3s ./ansible .
```
## Inventory

To achieve the minimal K3s deployment mentioned earlier, note these key configurations in the inventory file:

```yaml
server:
  hosts:
    api.k3s.ujstor.com:
  vars:
    k3s_version: v1.31.3+k3s1
    api_endpoint: "{{ groups['server'] | first }}"
    extra_server_args: >-
      --cluster-cidr=10.255.0.0/16
      --service-cidr=10.254.0.0/16
      --disable servicelb
      --disable traefik
      --flannel-backend=none
      --egress-selector-mode=disabled
      --disable-cloud-controller
      --disable-helm-controller
      --disable-network-policy
      --disable-kube-proxy
      --tls-san {{ api_endpoint }}
```

## Run Ansible

We are mounting SSH keys (created by Terraform) and the inventory file to the container:

```bash
docker run --rm -it \
    -v $(pwd)/inventory.yml:/config/inventory.yml \
    -v $(pwd)/terraform/hetzner-node/.ssh/k3s_hetzner_key:/secrets/ssh_key \
    -v $(pwd)/terraform/hetzner-node/.ssh/k3s_hetzner_key.pub:/secrets/ssh_key.pub \
    ansible-k3s
```

Ansible is custom configured in ansible.cfg, which is why mounting points can be different from classic Ansible configuration.

```bash
ansible-playbook k3s_deploy.yml
```

## Kubeconfig
After the Ansible playbook finishes, you will have a kubeconfig file in the Docker container's root. These files are used to access the K3s clusters.
Save them and later, you can [back up]() these files in the same MinIO tenant as your Terraform state and SSH keys.

```bash
cat kubeconfig
```

In the next steps, we will deploy Cilium and ArgoCD on the K3s0 cluster and see real magic happen.
