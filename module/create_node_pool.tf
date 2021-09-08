data "google_compute_zones" "available" {
}

locals {
  count_zones = length(data.google_compute_zones.available.names)
  # TODO: montar a chamada completa do script de bootstrap do nomad:
  # https://github.com/mentoriaiac/iac-role-nomad/blob/main/templates/nomad_bootstrap.sh
  nomad_bootstrap_script = trimprefix(var.node_pool.node_type, "nomad-") == "server" ? "nomad_boostrap.sh server ${var.node_pool.number_of_nodes}" : "nomad_boostrap.sh client"
}

module "compute_gcp" {
  # TODO: Alterar projeto após aprovação do PR:
  # https://github.com/mentoriaiac/iac-modulo-compute-gcp/pull/4
  source = "github.com/marcelomansur/iac-modulo-compute-gcp.git?ref=startup_script"

  count = lookup(var.node_pool, "number_of_nodes", 0)

  project    = var.project_id
  network    = var.network
  subnetwork = var.subnetwork

  instance_image = lookup(var.node_pool, "instance_image")
  machine_type   = lookup(var.node_pool, "machine_type")

  zone          = data.google_compute_zones.available.names[count.index % local.count_zones]
  instance_name = "${lookup(var.node_pool, "name")}-${count.index + 1}"

  # TODO: caso tipo seja nomad, passar local.bootstrap_script
  metadata_startup_script = can(regex("^nomad.*", var.node_pool.node_type)) ? local.nomad_bootstrap_script : ""

  labels = lookup(var.node_pool, "labels")
}

