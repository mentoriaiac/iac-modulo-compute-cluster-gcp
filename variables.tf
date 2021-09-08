variable "project_id" {
  type        = string
  description = "Project ID used to create node instances"
}

variable "name" {
  type        = string
  description = "The cluster name"
}

variable "region" {
  type        = string
  description = "The cluster region"
}

variable "network" {
  type        = string
  description = "The cluster network"
}

variable "subnetwork" {
  type        = string
  description = "The cluster subnetwork"
}

variable "node_pools" {
  type = list(object({
    number_of_nodes = number
    name            = string
    node_type       = string
    instance_image  = string
    machine_type    = string
    labels          = map(string)
  }))
  description = "Lis of objects containing information to create pools of node instances"
}
