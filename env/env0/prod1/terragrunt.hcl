inputs = {
    env_name = "Prod name"

    code_path = "env/prod1/"

    workspace = "prod1"
}

terraform {
    source = "../../../terraform/modules/env0"
}