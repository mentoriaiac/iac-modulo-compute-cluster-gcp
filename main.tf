data "google_compute_zones" "available" {
}

locals {
  count_zones = length(data.google_compute_zones.available.names)
}

module "compute_gcp" {
  source = "github.com/mentoriaiac/iac-modulo-compute-gcp.git"

  for_each = var.node_list

  project    = var.project
  network    = var.network
  subnetwork = var.subnetwork

  instance_image = each.value.instance_image
  machine_type   = each.value.machine_type

  zone          = data.google_compute_zones.available.names[1]
  instance_name = each.value.instance_name

  metadata_startup_script = each.value.metadata_startup_script

  tags   = each.value.network_tags
  labels = each.value.labels
}
