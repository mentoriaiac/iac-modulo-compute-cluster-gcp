output "compute_cluster_gcp" {
  value       = {
    client-node = module.compute_gcp[*].client-node
    server-node = module.compute_gcp[*].server-node
  }
  description = "The Public and Private IPs of client and server nodes"
}
