apiVersion: kubeadm.k8s.io/v1beta1
kind: ClusterConfiguration
kubernetesVersion: stable
clusterName: {{CLUSTER_NAME}}
controlPlaneEndpoint: {{LOADBALANCER_IP}}:{{LOADBALANCER_PORT}}
networking:
  podSubnet: {{K8SHA_POD_CIDR}}
  serviceSubnet: {{K8SHA_SVC_CIDR}}
