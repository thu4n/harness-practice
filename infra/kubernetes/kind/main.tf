resource "kind_cluster" "harness-ci" {
    name = "harness-ci"
    node_image = "kindest/node:v1.27.1"
    kind_config  {
        kind = "Cluster"
        api_version = "kind.x-k8s.io/v1alpha4"
        node {
            role = "control-plane"
        }
        node {
            role =  "worker"
        }
    }
}

output "kubeconfig" {
  value = kind_cluster.harness-ci.kubeconfig
}
