module "iac-modulo-compute-cluster-gcp" {
  source = "../"

  project    = "direct-link-325016"
  name       = "cluster_mentoria_test"
  region     = "us-central1"
  network    = "default"
  subnetwork = "default"

  node_list = var.node_list

}
variable "node_list" {
  description = "Map of compute for cluster"
}
