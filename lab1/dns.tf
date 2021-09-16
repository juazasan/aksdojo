# ================
#  Private DNS Zone
# ================

resource "azurerm_private_dns_zone" "aks_private_dns_zone" {
    name     = var.aks_private_dns_zone_name # != "" ? var.aks_private_dns_zone_name : format("privatelink.%s.azmk8s.io", lower(var.location))
    resource_group_name = azurerm_resource_group.cluster_rg.name
}
