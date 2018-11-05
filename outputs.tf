#
#
#

output "subscription_id" {
  description = "Azure Subscription ID."

  value = "${module.service_principal.subscription_id}"
}

output "tenant_id" {
  description = "Azure Tenant ID."
  
  value = "${module.service_principal.tenant_id}"
}

output "client_id" {
  description = "Azure Client ID (Application Object ID)."

  value = "${module.service_principal.client_id}"
}

output "client_secret" {
  description = "Azure Client Secrets (Applicaton password)"

  value = "${module.service_principal.client_secret}"
  sensitive = true
}

output "start_date" {
  description = "The Start Date which the Password is valid from."

  value = "${module.service_principal.start_date}"
}

output "end_date" {
  description = "The End Date which the Password is valid until."

  value = "${module.service_principal.end_date}"
}