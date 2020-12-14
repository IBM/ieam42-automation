resource "ibm_compute_bare_metal" "bare_metal" {
  count            = local.max_size_bm
  hostname         = "${var.bm_hostname}-${count.index}"
  domain           = var.bm_domain
  package_key_name = var.bm_package_key_name
  process_key_name = var.bm_process_key_name
  memory           = var.bm_memory
  os_key_name      = var.bm_os_key_name
  datacenter       = var.bm_datacenter[count.index]
  network_speed    = var.bm_network_speed
  public_bandwidth = var.bm_public_bandwidth
  disk_key_names   = var.bm_disk_key_names
  hourly_billing   = var.bm_hourly_billing
  public_vlan_id   = var.bm_public_vlan_id
  private_vlan_id  = var.bm_private_vlan_id
}

resource "ibm_compute_vm_instance" "virtual_server" {
  count                    = local.max_size_vs
  hostname                 = var.vs_hostname
  domain                   = var.bm_domain
  os_reference_code        = var.vs_os_reference_code
  datacenter               = var.vs_datacenter[count.index]
  network_speed            = var.bm_network_speed
  hourly_billing           = true
  local_disk               = false
  private_network_only     = false
  flavor_key_name          = var.vs_flavor_key_name
  dedicated_acct_host_only = false
}