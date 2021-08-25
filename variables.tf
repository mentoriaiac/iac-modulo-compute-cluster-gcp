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
  type        = list(map(any))
  description = "Map containing information to create pools of node instances"
}
