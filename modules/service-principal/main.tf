#
#
#

# Azure AD Application homepage
data "template_file" "homepage" {
  template = "$${homepage}"

  vars {
    homepage = "${var.homepage == "" ? format("https://%s", urlencode(var.name)) : var.homepage}"
  }
}

data "template_file" "now" {
  template = "$${date}"

  vars {
    date = "${timestamp()}"
  }
}

# Azure AD Application containing the Service Principal
resource "azurerm_azuread_application" "azure_application" {
  name                       = "${var.name}"
  homepage                   = "${coalesce(var.homepage, data.template_file.homepage.rendered)}"
  identifier_uris            = [ "${coalescelist(var.identifier_uris, split(",", data.template_file.homepage.rendered))}" ]
  reply_urls                 = "${var.reply_urls}"
  available_to_other_tenants = "${var.available_to_other_tenants}"
  oauth2_allow_implicit_flow = "${var.oauth2_allow_implicit_flow}"
}

# Azure AD Serrvice Principal
resource "azurerm_azuread_service_principal" "service_principal" {
  application_id = "${azurerm_azuread_application.azure_application.application_id}"
}

# Azure AD Service Principal secret
resource "azurerm_azuread_service_principal_password" "service_principal_password" {
  service_principal_id = "${azurerm_azuread_service_principal.service_principal.id}"
  value      = "${uuid()}"
  end_date   = "${coalesce(var.start_date, timeadd(data.template_file.now.rendered, "720h"))}"
  start_date = "${coalesce(var.end_date, data.template_file.now.rendered)}"

  lifecycle {
    ignore_changes = [ "value", "start_date", "end_date" ]
  }
}

# Current Azure configuration
data "azurerm_client_config" "current" {
}
