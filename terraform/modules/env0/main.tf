variable "code_path" {}
variable "env_name" {}


terraform {
  required_providers {
    env0 = {
      source = "env0/env0"
    }
  }
}

provider "env0" {
}

data "env0_project" "default_project" {
  name = "TestNan"
}

resource "env0_environment" "new_env" {
  name        = var.env_name
  project_id  = data.env0_project.default_project.id
  deploy_on_push = true

  is_remote_backend = true

  without_template_settings {
    is_terragrunt_run_all = true
    path = var.code_path
    type = terragrunt
  }
}