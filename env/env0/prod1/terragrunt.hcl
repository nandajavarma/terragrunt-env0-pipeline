inputs = {
    env_name = "Prod name"

    code_path = "env/prod1/"

    workspace = "prod1"
}

terraform {
    source = "../../../terraform/modules/env0"
}

remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    location = "eu"
    bucket = "new-prid1-bukcet"
    prefix = "env0/pr0d1"
    project = "nvn-self-hosted-playground"
  }
}