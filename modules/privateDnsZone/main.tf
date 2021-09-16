# ================
#  Private DNS Zone
# ================

resource "azurerm_private_dns_zone" "private_dns_zone" {
    name     = local.private_dns_zone_name
    location = azurerm_resource_group.cluster_rg.location
}

locals {
  private_dns_zone_name = var.private_dns_zone_name != "" ? var.private_dns_zone_name : format("privatelink.%s.azmk8s.io", lower(azurerm_resource_group.cluster_rg.location))
}