resource "hcloud_network" "this" {
  delete_protection = false
  name              = var.network_name
  ip_range          = "10.0.0.0/16"

  labels = var.tags
}

resource "hcloud_primary_ip" "this" {
  for_each      = var.instances_config
  name          = each.value.name
  datacenter    = each.value.datacenter
  type          = "ipv4"
  assignee_type = "server"
  auto_delete   = "true"
  labels        = var.tags
}

resource "hcloud_firewall" "this" {
  for_each = var.instances_config
  name     = each.value.name

  dynamic "rule" {
    for_each = each.value.rules

    content {
      direction  = rule.value.direction
      protocol   = rule.value.protocol
      port       = rule.value.port
      source_ips = rule.value.source_ips
    }
  }
}
