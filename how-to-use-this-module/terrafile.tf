module "iac-modulo-compute-cluster-gcp" {
  source = "../"

  project_id = "hardening-322021"
  name       = "cluster_mentoria_test"
  region     = "us-east1"
  network    = "default"
  subnetwork = "default"

  node_pools = [
    {
      number_of_compute = 1
      name              = "cp-node"
      machine_type      = "e2-medium"
      instance_image    = "debian-cloud/debian-9"
      # metadata_startup_script = "startup-cp.sh"
      labels = {
        terraform = "true",
        component = "k8s_control_plane"
      }
    },
    {
      number_of_compute = 3
      name              = "worker-node"
      machine_type      = "e2-medium"
      instance_image    = "debian-cloud/debian-9"
      # metadata_startup_script = "startup-worker.sh"
      labels = {
        terraform = "true",
        component = "k8s_worker_node"
      }
    },
  ]

}
