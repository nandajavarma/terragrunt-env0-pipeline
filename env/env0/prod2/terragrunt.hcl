inputs = {
    env_name = "Prod name 2"

    code_path = "env/prod2/"

    workspace = "prod2"
}

terraform {
    source = "../../../terraform/modules/env0"
}