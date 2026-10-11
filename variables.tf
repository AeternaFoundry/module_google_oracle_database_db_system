variable "oracle_database_db_systems" {
  description = <<EOT
Map of oracle_database_db_systems, attributes below
Required:
    - db_system_id
    - display_name
    - location
    - odb_subnet
Optional:
    - deletion_policy
    - deletion_protection
    - gcp_oracle_zone
    - labels
    - odb_network
    - project
    - properties (block):
        - compute_count (required)
        - compute_model (optional)
        - data_collection_options (optional, block):
            - is_diagnostics_events_enabled (optional)
            - is_incident_logs_enabled (optional)
        - data_storage_size_gb (optional)
        - database_edition (required)
        - db_home (optional, block):
            - database (required, block):
                - admin_password (required)
                - character_set (optional)
                - database_id (required)
                - db_home_name (optional)
                - db_name (optional)
                - db_unique_name (optional)
                - gcp_oracle_zone (optional)
                - ncharacter_set (optional)
                - pluggable_database_id (optional)
                - pluggable_database_name (optional)
                - properties (optional, block):
                    - database_management_config (optional, block):
                    - db_backup_config (optional, block):
                        - auto_backup_enabled (optional)
                        - auto_full_backup_day (optional)
                        - auto_full_backup_window (optional)
                        - auto_incremental_backup_window (optional)
                        - backup_deletion_policy (optional)
                        - backup_destination_details (optional, block):
                            - type (optional)
                        - retention_period_days (optional)
                    - db_version (required)
                - tde_wallet_password (optional)
            - db_version (required)
            - display_name (optional)
            - is_unified_auditing_enabled (optional)
        - db_system_options (optional, block):
            - storage_management (optional)
        - domain (optional)
        - hostname_prefix (optional)
        - initial_data_storage_size_gb (required)
        - license_model (required)
        - memory_size_gb (optional)
        - node_count (optional)
        - private_ip (optional)
        - reco_storage_size_gb (optional)
        - shape (required)
        - ssh_public_keys (required)
        - time_zone (optional, block):
            - id (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    db_system_id        = string
    display_name        = string
    location            = string
    odb_subnet          = string
    deletion_policy     = optional(string)
    deletion_protection = optional(bool)
    gcp_oracle_zone     = optional(string)
    labels              = optional(map(string))
    odb_network         = optional(string)
    project             = optional(string)
    properties = optional(object({
      compute_count = number
      compute_model = optional(string)
      data_collection_options = optional(object({
        is_diagnostics_events_enabled = optional(bool)
        is_incident_logs_enabled      = optional(bool)
      }))
      data_storage_size_gb = optional(number)
      database_edition     = string
      db_home = optional(object({
        database = object({
          admin_password          = string
          character_set           = optional(string)
          database_id             = string
          db_home_name            = optional(string)
          db_name                 = optional(string)
          db_unique_name          = optional(string)
          gcp_oracle_zone         = optional(string)
          ncharacter_set          = optional(string)
          pluggable_database_id   = optional(string)
          pluggable_database_name = optional(string)
          properties = optional(object({
            database_management_config = optional(object({
            }))
            db_backup_config = optional(object({
              auto_backup_enabled            = optional(bool)
              auto_full_backup_day           = optional(string)
              auto_full_backup_window        = optional(string)
              auto_incremental_backup_window = optional(string)
              backup_deletion_policy         = optional(string)
              backup_destination_details = optional(list(object({
                type = optional(string)
              })))
              retention_period_days = optional(number)
            }))
            db_version = string
          }))
          tde_wallet_password = optional(string)
        })
        db_version                  = string
        display_name                = optional(string)
        is_unified_auditing_enabled = optional(bool)
      }))
      db_system_options = optional(object({
        storage_management = optional(string)
      }))
      domain                       = optional(string)
      hostname_prefix              = optional(string)
      initial_data_storage_size_gb = number
      license_model                = string
      memory_size_gb               = optional(number)
      node_count                   = optional(number)
      private_ip                   = optional(string)
      reco_storage_size_gb         = optional(number)
      shape                        = string
      ssh_public_keys              = list(string)
      time_zone = optional(object({
        id = optional(string)
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

