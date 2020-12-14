resource "ibm_resource_instance" "cos_instance" {
  name              = "${var.project_name}-${var.environment}-ocp_cos_instance"
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
  resource_group_id = data.ibm_resource_group.group.id
}

resource "ibm_container_cluster" "iac_iks_cluster" {
  name                     = "${var.project_name}-${var.environment}-cluster"
  datacenter               = var.datacenter
  default_pool_size        = var.workers_count
  machine_type             = var.machine_type
  hardware                 = var.hardware
  kube_version             = var.k8s_version
  public_vlan_id           = var.public_vlan_id
  private_vlan_id          = var.private_vlan_id
  entitlement              = "cloud_pak"
  public_service_endpoint  = var.enable_public_service_endpoint
  private_service_endpoint = var.enable_private_service_endpoint
  resource_group_id        = data.ibm_resource_group.group.id
}

resource "ibm_container_worker_pool" "iac_iks_cluster_pool" {
  count             = local.max_size
  worker_pool_name  = "${var.project_name}-${var.environment}-wp-${format("%02s", count.index)}"
  machine_type      = var.machine_type
  cluster           = ibm_container_cluster.iac_iks_cluster.id
  size_per_zone     = var.workers_count
  hardware          = var.hardware
  resource_group_id = data.ibm_resource_group.group.id
}

resource "ibm_container_worker_pool_zone_attachment" "iac_iks_cluster_pool_attachment" {
  count             = local.max_size
  cluster           = ibm_container_cluster.iac_iks_cluster.id
  worker_pool       = element(split("/", ibm_container_worker_pool.iac_iks_cluster_pool[count.index].id), 1)
  zone              = var.additional_zone_names[count.index]
  private_vlan_id   = var.additional_zone_private_service_endpoint[count.index]
  public_vlan_id    = var.additional_zone_public_service_endpoint[count.index]
  resource_group_id = data.ibm_resource_group.group.id
}
