resource "digitalocean_kubernetes_cluster" "harness-ci" {
  name   = "harness-ci"
  region = "sgp1"
  version = "latest"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb"
    node_count = 2
  }
  tags = ["harness"]
}
