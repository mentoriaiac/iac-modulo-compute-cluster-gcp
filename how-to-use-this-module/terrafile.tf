module "iac-modulo-compute-cluster-gcp" {
  source = "../"

  project_id = "hardening-322021"
  name       = "cluster_mentoria_test"
  region     = "us-east1"
  network    = "default"
  subnetwork = "default"

  node_pools = [
    {
      name           = "cp-node"
      machine_type   = "e2-medium"
      node_locations = "us-central1-b,us-central1-c"
      count          = 1
      instance_image = "debian-cloud/debian-9"
      # metadata_startup_script = "startup-cp.sh"   
    },
    {
      name           = "worker-node"
      machine_type   = "e2-medium"
      node_locations = "us-central1-b,us-central1-c"
      count          = 3
      instance_image = "debian-cloud/debian-9"
      # metadata_startup_script = "startup-worker.sh"
    },
  ]

}
