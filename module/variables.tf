variable "node_pool" {
  type = object({
    number_of_nodes = number
    name            = string
    instance_image  = string
    node_type       = string
    machine_type    = string
    labels          = map(string)
  })
  description = "Object containing information to create a pool of node instances"

  validation {
    condition     = contains(["nomad-server", "nomad-client", "rke-cp", "rke-worker"], lookup(var.node_pool, "node_type"))
    error_message = "Valores suportados para variável node_type: nomad-server, nomad-client, rke-cp, rke-worker."
  }
}

variable "project_id" {
  type        = string
  description = "Project ID used to create node instances"
}

variable "network" {
  type        = string
  description = "Network used to create node instances"
}

variable "subnetwork" {
  type        = string
  description = "Subnetwork used to create node instances"
}

variable "metadata_startup_script" {
  type        = string
  description = "Startup script to use on node instances"
  default     = ""
}
