#
#
#

output "subscription_id" {
  description = "Azure Subscription ID."

  value = "${data.azurerm_client_config.current.subscription_id}"
}

output "tenant_id" {
  description = "Azure Tenant ID."
  
  value = "${data.azurerm_client_config.current.tenant_id}"
}

output "client_id" {
  description = "Azure Client ID (Application Object ID)."

  value = "${azurerm_azuread_service_principal.service_principal.id}"
}

output "client_secret" {
  description = "Azure Client Secrets (Applicaton password)"

  value = "${azurerm_azuread_service_principal_password.service_principal_password.value}"
  sensitive = true
}

output "start_date" {
  description = "The Start Date which the Password is valid from."

  value = "${azurerm_azuread_service_principal_password.service_principal_password.start_date}"
}

output "end_date" {
  description = "The End Date which the Password is valid until."

  value = "${azurerm_azuread_service_principal_password.service_principal_password.end_date}"
}