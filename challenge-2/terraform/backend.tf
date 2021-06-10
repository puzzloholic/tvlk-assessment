terraform {
  required_version = ">= 0.14.8"

  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.3.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "=2.1.2"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = var.kubectl_context
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = var.kubectl_context
  }
}

provider "kubectl" {
  config_path    = "~/.kube/config"
  config_context = var.kubectl_context
}