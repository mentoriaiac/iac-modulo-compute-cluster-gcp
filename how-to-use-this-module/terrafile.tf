module "iac-modulo-compute-cluster-gcp" {
  source = "../"

  project_id = "hardening-322021"
  name       = "cluster_mentoria_test"
  region     = "us-central1"
  network    = "default"
  subnetwork = "default"

  node_pools = [
    # Nodes RKE
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
      number_of_nodes = 1
      name            = "worker-node"
      machine_type    = "e2-medium"
      instance_image  = "debian-cloud/debian-9"
      node_type       = "rke-worker"
      labels = {
        terraform = "true",
        component = "k8s_worker_node"
      }
    },
    # Nodes Nomad
    # Server and client standalone
    {
      number_of_nodes         = 1
      name                    = "both-node"
      machine_type            = "e2-medium"
      instance_image          = "debian-cloud/debian-9"
      metadata_startup_script = "echo 'nomad_boostrap.sh both 1' > /tmp/nomad_bootstrap.txt"
      labels = {
        terraform = "true",
        component = "nomad_server"
      }
    },
    # Cluster
    {
      number_of_nodes         = 1
      name                    = "server-node"
      machine_type            = "e2-medium"
      instance_image          = "debian-cloud/debian-9"
      metadata_startup_script = "echo 'nomad_boostrap.sh server 3' > /tmp/nomad_bootstrap.txt"
      labels = {
        terraform = "true",
        component = "nomad_server"
      }
    },
    {
      number_of_nodes         = 2
      name                    = "client-node"
      machine_type            = "e2-medium"
      instance_image          = "debian-cloud/debian-9"
      metadata_startup_script = "echo 'nomad_boostrap.sh client' > /tmp/nomad_bootstrap.txt"
      labels = {
        terraform = "true",
        component = "nomad_client"
      }
    },
  ]

}
