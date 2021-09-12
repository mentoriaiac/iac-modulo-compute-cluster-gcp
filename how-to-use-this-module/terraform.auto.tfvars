node_list = {
  server-node = {
    instance_name           = "server-node"
    machine_type            = "e2-medium"
    instance_image          = "debian-cloud/debian-9"
    metadata_startup_script = "echo 'nomad_boostrap.sh server 3' > /tmp/nomad_bootstrap.txt"
    network_tags            = ["nomad-server"]
    labels = {
      terraform = "true",
      component = "nomad_server"
    }
  },
  client-node = {
    instance_name           = "client-node"
    machine_type            = "e2-medium"
    instance_image          = "debian-cloud/debian-9"
    metadata_startup_script = "echo 'nomad_boostrap.sh client' > /tmp/nomad_bootstrap.txt"
    network_tags            = ["nomad-client"]
    labels = {
      terraform = "true",
      component = "nomad_client"
    }
  }
}
