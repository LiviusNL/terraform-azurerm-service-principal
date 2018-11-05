#
#
#

provider "azurerm" { }

resource "random_uuid" "name_uuid" { }

module "service_principal" {
  source = "./modules/service-principal"

  name = "${coalesce(var.name, format("terraform-%s", random_uuid.name_uuid.result))}"
}
