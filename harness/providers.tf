terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "../kubernetes/kind/harness-ci-config"
  }
}
