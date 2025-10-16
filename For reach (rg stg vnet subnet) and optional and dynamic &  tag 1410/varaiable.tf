variable "stog" {
  type = map(object(
    {
      name                            = string
      resource_group_name             = string
      location                        = string
      account_tier                    = string
      account_replication_type        = string
      public_network_access_enabled   = optional(bool, true)
      default_to_oauth_authentication = optional(bool, true)
      is_hns_enabled                  = optional(bool, false)
      nfsv3_enabled                   = optional(bool, false)
      shared_access_key_enabled       = optional(bool, true)
      cost_center         = optional(string)  # ADD THIS
    owner               = optional(string)  # ADD THIS
    team_name           = optional(string)

      # network_rules = optional (object)

  }))
}




variable "v_net" {
  type = map(object(
    {
      name                = string
      location            = string
      resource_group_name = string
      address_space       = list(string)
      dns_servers         = optional(list(string))
      cost_center         = optional(string)  # ADD THIS
    owner               = optional(string)  # ADD THIS
    team_name           = optional(string)
    }


  ))
}

variable "sub_net" {
  type = map(object(
    {
      name             = string
      address_prefixes = list(string)


    }
  ))
}