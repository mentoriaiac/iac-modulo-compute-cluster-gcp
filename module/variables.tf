variable "node_pool" {
  type = object({
    number_of_nodes         = number
    name                    = string
    instance_image          = string
    metadata_startup_script = optional(string)
    machine_type            = string
    labels                  = map(string)
  })
  description = "Object containing information to create a pool of node instances"
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
