module "iac-modulo-compute-cluster-gcp" {
  source = "../"

  project_id = "hardening-322021"
  name       = "cluster_mentoria_test"
  region     = "us-east1"
  network    = "default"
  subnetwork = "default"

  node_pools = [
    {
      number_of_nodes = 1
      name            = "cp-node"
      machine_type    = "e2-medium"
      instance_image  = "debian-cloud/debian-9"
      node_type       = "rke-cp"
      labels = {
        terraform = "true",
        component = "k8s_control_plane"
      }
    },
    {
      number_of_nodes = 3
      name            = "worker-node"
      machine_type    = "e2-medium"
      instance_image  = "debian-cloud/debian-9"
      node_type       = "rke-worker"
      labels = {
        terraform = "true",
        component = "k8s_worker_node"
      }
    },
    {
      number_of_nodes = 1
      name            = "server-node"
      machine_type    = "e2-medium"
      instance_image  = "debian-cloud/debian-9"
      node_type       = "nomad-server"
      labels = {
        terraform = "true",
        component = "nomad_server"
      }
    },
    {
      number_of_nodes = 3
      name            = "client-node"
      machine_type    = "e2-medium"
      instance_image  = "debian-cloud/debian-9"
      node_type       = "nomad-client"
      labels = {
        terraform = "true",
        component = "nomad_client"
      }
    },
  ]

}
