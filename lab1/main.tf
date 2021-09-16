# ================
#  Resource Group
# ================

resource "azurerm_resource_group" "cluster_rg" {
  name     = var.resource_group_name
  location = var.location
}

# ================
#  AKS Cluster
# ================

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.cluster_rg.location
  resource_group_name = azurerm_resource_group.cluster_rg.name
  kubernetes_version = var.aks_cluster_kubernetes_version
  private_cluster_enabled = true
  dns_prefix_private_cluster = var.aks_cluster_dns_prefix
  private_dns_zone_id = azurerm_private_dns_zone.aks_private_dns_zone.id
  
  default_node_pool {
    name       = "system"
    node_count = var.aks_systempool_node_count
    vm_size    = var.aks_systempool_vm_size
  }

  identity {
    type = "UserAssigned"
    user_assigned_identity_id = azurerm_user_assigned_identity.aks_mi.id
  }

  network_profile {
    network_plugin = "azure"
  }

  depends_on = [
    azurerm_role_assignment.aks_mi_private_dns_zone_contributor
  ]

}

data "azurerm_client_config" "current" {
}