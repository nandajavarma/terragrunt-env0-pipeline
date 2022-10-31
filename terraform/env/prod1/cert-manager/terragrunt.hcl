include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "../../../modules/cert-manager"
}

depends_on = ["../cluster"]