include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "../../../terraform/modules/k3s"
}