module "ci-delegate" {
  source = "harness/harness-delegate/kubernetes"
  version = "0.2.2"

  account_id = var.account_id
  delegate_token = var.delegate_token
  delegate_name = var.delegate_name
  deploy_mode = "KUBERNETES"
  namespace = "harness-delegate-ng"
  manager_endpoint = "https://app.harness.io"
  delegate_image = "us-docker.pkg.dev/gar-prod-setup/harness-public/harness/delegate:25.06.86100"
  replicas = 1
  upgrader_enabled = true
}

resource "harness_platform_connector_kubernetes" "inheritFromDelegate" {
  identifier  = "cicluster"
  name        = "cicluster"

  inherit_from_delegate {
    delegate_selectors = [ var.delegate_name ]
  }
  depends_on = [ module.ci-delegate ]
}
