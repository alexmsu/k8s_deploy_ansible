apiVersion: kubeadm.k8s.io/v1alpha3
kind: ClusterConfiguration
kubernetesVersion: stable

apiServerCertSANs:
- {{ansible_default_ipv4.address}}

etcd:
  local:
    extraArgs:
      listen-client-urls: "https://127.0.0.1:2379,https://{{ansible_default_ipv4.address}}:2379"
      advertise-client-urls: "https://{{ansible_default_ipv4.address}}:2379"
      listen-peer-urls: "https://{{ansible_default_ipv4.address}}:2380"
      initial-advertise-peer-urls: "https://{{ansible_default_ipv4.address}}:2380"
      initial-cluster: "{{ansible_hostname}}=https://{{ansible_default_ipv4.address}}:2380"
      initial-cluster-state: "new"
    serverCertSANs:
      - {{ansible_hostname}}
      - {{ansible_default_ipv4.address}}
    peerCertSANs:
      - {{ansible_hostname}}
      - {{ansible_default_ipv4.address}}

networking:
  podSubnet: {{K8SHA_POD_CIDR}}
  serviceSubnet: {{K8SHA_SVC_CIDR}}
