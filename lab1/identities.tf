# ===================
#  Cluster Identiies
# ===================

# AKS

resource "azurerm_user_assigned_identity" "aks_mi" { # Control Plane
  name                = "${var.aks_cluster_name}-mi"
  resource_group_name = azurerm_resource_group.cluster_rg.name
  location            = azurerm_resource_group.cluster_rg.location
}