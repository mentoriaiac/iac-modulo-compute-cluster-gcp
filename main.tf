module "create_node_pool" {
  source = "./module"
  count  = length(var.node_pools)

  project_id = var.project_id
  network    = var.network
  subnetwork = var.subnetwork
  node_pool  = element(var.node_pools, count.index)
}
