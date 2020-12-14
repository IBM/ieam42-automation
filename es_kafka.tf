resource "ibm_resource_instance" "es_instance_1" {
  count             = var.enable_event_streams_service ? 1 : 0
  name              = var.es_kafka_service_name
  service           = "messagehub"
  plan              = var.es_kafka_plan
  location          = var.region
  resource_group_id = data.ibm_resource_group.group.id
}
