# module "compute-cluster" {
#   source     = "git@github.com:mentoriaiac/iac-modulo-compute-cluster-gcp.git?tag=v0.0.1"

#   name       = "mentoria-cluster"

#   project_id = "<PROJECT ID>"
#   region     = "us-central1"
#   zones      = ["us-central1-a", "us-central1-b", "us-central1-f"]
#   network    = "vpc-01"
#   subnetwork = "us-central1-01"

#   node_pools = [
#     {
#       name = "cp-node" # vai virar o name do cluster + instance_name + count
#       # exemplo: "mentoria-cluster-cp-node-1"
#       machine_type            = "e2-medium"
#       node_locations          = "us-central1-b,us-central1-c" # no loop vai virar 1 zone por node ou instancia
#       count                   = 1                             # quantidade de nós
#       instance_image          = "debian-cloud/debian-9"       # é a imagem da maquina
#       metadata_startup_script = "startup-cp.sh"               # tem que ser implementado no modulo iac-modulo-compute-gcp
#     },
#     {
#       name = "worker-node" # vai virar o name do cluster + instance_name + count
#       # exemplo: "mentoria-cluster-worker-node-1"
#       # "mentoria-cluster-worker-node-2"
#       # "mentoria-cluster-worker-node-3"
#       machine_type            = "e2-medium"
#       node_locations          = "us-central1-b,us-central1-c" # no loop vai virar 1 zone por node ou instancia
#       count                   = 3                             # quantidade de nós
#       instance_image          = "debian-cloud/debian-9"       # é a imagem da maquina
#       metadata_startup_script = "startup-worker.sh"
#     },
#   ]
# }



data "google_compute_zones" "available" {
}

variable "node_pool" {
  type = map(any)
}

variable "project" {
  type = string
}

variable "network" {
  type = string
}

locals {
  available-zones         = length(data.google_compute_zones.available.names)
  metadata_startup_script = "startup-cp.sh"
}

module "compute_gcp" {
  source = "github.com/mentoriaiac/iac-modulo-compute-gcp.git"

  count = lookup(var.node_pool, "count", 0)

  project        = var.project
  network        = var.network

  instance_image = lookup(var.node_pool, "instance_image")
  machine_type   = lookup(var.node_pool, "machine_type", 0)

  zone = data.google_compute_zones.available.names[count.index % local.available-zones]
  instance_name = "${lookup(var.node_pool, "name", uuid())}-${count.index + 1}"

  # TODO: criar essa input no modulo compute
  # metadata_startup_script = metadata_startup_script

  # TODO: como receber labels no hash de node_pools
  labels = {
    value = "key"
  }
}

output "nodes" {
  value = module.compute_gcp
}
