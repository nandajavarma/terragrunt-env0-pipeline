variable "code_path" {}
variable "env_name" {}
variable "env0_api_secret" {}
variable "env0_api_key" {}
variable "workspace" {}


terraform {
  required_providers {
    env0 = {
      source = "env0/env0"
    }
  }
}

provider "env0" {
    api_key    = var.env0_api_key
    api_secret = var.env0_api_secret
}

data "env0_project" "default_project" {
  name = "TestNan"
}

resource "env0_environment" "new_env" {
  name        = var.env_name
  project_id  = data.env0_project.default_project.id

  is_remote_backend = true

  without_template_settings {
    repository = "https://github.com/nandajavarma/terragrunt-env0-pipeline"
    github_installation_id = "30630494"
    is_terragrunt_run_all = true
    path = var.code_path
    type = "terragrunt"
    terragrunt_version = "0.38.0"
  }

  revision = "main"
  run_plan_on_pull_requests = true

  workspace = var.workspace
}