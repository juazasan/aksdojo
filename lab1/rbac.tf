resource "azurerm_role_assignment" "aks_mi_private_dns_zone_contributor" {
  scope                = azurerm_private_dns_zone.aks_private_dns_zone.id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_mi.principal_id
}