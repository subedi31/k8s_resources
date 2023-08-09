module "namespace" {
  source          = "./modules/namespace"
}

module "cluster-roles" {
  source          = "./modules/cluster-roles"
}

module "networkpolicy" {
  source          = "./modules/newtworkpolicy"
}


module "roles" {
  source          = "./modules/roles"
}



