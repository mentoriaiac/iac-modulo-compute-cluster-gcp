data "google_compute_zones" "available" {
}

locals {
  count_zones = length(data.google_compute_zones.available.names)
}

module "compute_gcp" {
  source = "github.com/mentoriaiac/iac-modulo-compute-gcp.git"

  count = lookup(var.node_pool, "count", 0)

  project    = var.project_id
  network    = var.network
  subnetwork = var.subnetwork

  instance_image = lookup(var.node_pool, "instance_image")
  machine_type   = lookup(var.node_pool, "machine_type")

  zone          = data.google_compute_zones.available.names[count.index % local.count_zones]
  instance_name = "${lookup(var.node_pool, "name")}-${count.index + 1}"

  # TODO: criar essa input no modulo compute
  # metadata_startup_script = var.metadata_startup_script

  # TODO: como receber labels no hash de node_pools
  labels = {
    value = "key"
  }
}

