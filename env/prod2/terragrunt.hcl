inputs = {
    name = "testing-terragrunt"

    domain_name = "nandaja-env0.tests.gitpod-self-hosted.com"

    region  = "europe-west1"
    zone    = "europe-west1-b"
    project = "nvn-self-hosted-playground"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "helm" {
  kubernetes {
    config_path = var.kubeconfig
  }
}
EOF
}