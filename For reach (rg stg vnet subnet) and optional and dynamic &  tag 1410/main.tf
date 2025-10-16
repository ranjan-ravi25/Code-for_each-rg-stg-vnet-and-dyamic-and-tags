resource "azurerm_resource_group" "example" {
  name     = "rg12"
  location = "West Europe"
}






resource "azurerm_storage_account" "stg" {
  for_each                        = var.stog
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  account_tier                    = each.value.account_tier
  account_replication_type        = each.value.account_replication_type
  public_network_access_enabled   = each.value.public_network_access_enabled
  default_to_oauth_authentication = each.value.default_to_oauth_authentication
  is_hns_enabled                  = each.value.is_hns_enabled
  nfsv3_enabled                   = each.value.nfsv3_enabled
  shared_access_key_enabled       = each.value.shared_access_key_enabled

  #   network_rules  {
  #     default_action             = "Allow"
  #     ip_rules                   = each.value.network_rules.allow_ip_rules
  # }

  
  tags = {
    cost_center = each.value.cost_center
    owner       = each.value.owner
    team_name   = each.value.team_name

  }

}


resource "azurerm_virtual_network" "virt_net" {
  for_each            = var.v_net
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers
  tags = {
    cost_center = each.value.cost_center
    owner       = each.value.owner
    team_name   = each.value.team_name
  }


  dynamic "subnet" {
    for_each = var.sub_net
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }
  
}
  