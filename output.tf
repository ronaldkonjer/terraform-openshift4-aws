output "cluster_name" {
  value       = var.clustername
  description = "This platform name"
}

output "master_ip_addresses" {
  value       = module.masters.ip_addresses
  description = "OpenShift master URL"
}

output "bastion_ssh_spec" {
  value       = "core@${module.bootstrap.ip_address}"
  description = "Bastion SSH info for login. 'ssh `terraform output bastion_ssh`'"
}

output "private_key" {
  sensitive   = true
  value       = module.installer.private_ssh_key
  description = "private key for instances"
}

