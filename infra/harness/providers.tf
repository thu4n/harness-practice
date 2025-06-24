terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0"
    }
    harness = {
      source = "harness/harness"
      version = "0.37.5"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "../kubernetes/kind/harness-ci-config"
  }
}

provider "harness" {
  endpoint         = "https://app.harness.io/gateway"
  account_id       = var.account_id
  platform_api_key = var.platform_api_key
}
