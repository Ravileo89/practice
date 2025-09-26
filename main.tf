#toset
resource "azurerm_resource_group" "example" {
  for_each = toset(["test1", "test2", "test3", "test3"])

  name     = each.value
  location = "East US"
}

resource "azurerm_resource_group" "example" {
  for_each = var.rgs

  name     = each.value.name
  location = each.value.location
}


resource "azurerm_storage_account" "stg1" {
depends_on = [azurerm_resource_group.example ]
for_each = var.stg
  name = each.value.storage_account_name
  location = each.value.resource_group_location
  resource_group_name = each.value.resource_group_name
  account_replication_type = "LRS"
  account_tier = "Standard"
}


module "name" {
  
}