variable "project" {
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
variable "node_list" {
  description = "Map of compute for cluster"
  type = map
}
