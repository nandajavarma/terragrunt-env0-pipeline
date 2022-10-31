include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "../../../modules/external-dns"
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

dependencies {
  paths = ["../cluster"]
}