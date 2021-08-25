provider "google" {
  project     = "hardening-322021"
  region      = "us-east1"
  credentials = "/gcloud/application_default_credentials.json"
  # version = "3.0"
}

locals {
  project        = "hardening-322021"
  network        = "default"

  node_pools = [
    {
      name = "cp-node" # vai virar o name do cluster + instance_name + count
      # exemplo: "mentoria-cluster-cp-node-1"
      machine_type            = "e2-medium"
      node_locations          = "us-central1-b,us-central1-c" # no loop vai virar 1 zone por node ou instancia
      count                   = 1                             # quantidade de nós
      instance_image          = "debian-cloud/debian-9"       # é a imagem da maquina
      # metadata_startup_script = "startup-cp.sh"               # tem que ser implementado no modulo iac-modulo-compute-gcp
    },
    {
      name = "worker-node" # vai virar o name do cluster + instance_name + count
      # exemplo: "mentoria-cluster-worker-node-1"
      # "mentoria-cluster-worker-node-2"
      # "mentoria-cluster-worker-node-3"
      machine_type            = "e2-medium"
      node_locations          = "us-central1-b,us-central1-c" # no loop vai virar 1 zone por node ou instancia
      count                   = 1                             # quantidade de nós
      instance_image          = "debian-cloud/debian-9"       # é a imagem da maquina
      # metadata_startup_script = "startup-worker.sh"
    },
  ]

}

module "sub" {
  source = "./submodule"
  count = length(local.node_pools)

  project = local.project
  network = local.network
  node_pool = element(local.node_pools, count.index)
}
