resource "google_oracle_database_db_system" "oracle_database_db_systems" {
  for_each = var.oracle_database_db_systems

  db_system_id        = each.value.db_system_id
  display_name        = each.value.display_name
  location            = each.value.location
  odb_subnet          = each.value.odb_subnet
  deletion_policy     = each.value.deletion_policy
  deletion_protection = each.value.deletion_protection
  gcp_oracle_zone     = each.value.gcp_oracle_zone
  labels              = each.value.labels
  odb_network         = each.value.odb_network
  project             = each.value.project

  dynamic "properties" {
    for_each = each.value.properties != null ? [each.value.properties] : []
    content {
      compute_count = properties.value.compute_count
      compute_model = properties.value.compute_model
      dynamic "data_collection_options" {
        for_each = properties.value.data_collection_options != null ? [properties.value.data_collection_options] : []
        content {
          is_diagnostics_events_enabled = data_collection_options.value.is_diagnostics_events_enabled
          is_incident_logs_enabled      = data_collection_options.value.is_incident_logs_enabled
        }
      }
      data_storage_size_gb = properties.value.data_storage_size_gb
      database_edition     = properties.value.database_edition
      dynamic "db_home" {
        for_each = properties.value.db_home != null ? [properties.value.db_home] : []
        content {
          database {
            admin_password          = db_home.value.database.admin_password
            character_set           = db_home.value.database.character_set
            database_id             = db_home.value.database.database_id
            db_home_name            = db_home.value.database.db_home_name
            db_name                 = db_home.value.database.db_name
            db_unique_name          = db_home.value.database.db_unique_name
            gcp_oracle_zone         = db_home.value.database.gcp_oracle_zone
            ncharacter_set          = db_home.value.database.ncharacter_set
            pluggable_database_id   = db_home.value.database.pluggable_database_id
            pluggable_database_name = db_home.value.database.pluggable_database_name
            dynamic "properties" {
              for_each = db_home.value.database.properties != null ? [db_home.value.database.properties] : []
              content {
                dynamic "database_management_config" {
                  for_each = properties.value.database_management_config != null ? [properties.value.database_management_config] : []
                  content {
                  }
                }
                dynamic "db_backup_config" {
                  for_each = properties.value.db_backup_config != null ? [properties.value.db_backup_config] : []
                  content {
                    auto_backup_enabled            = db_backup_config.value.auto_backup_enabled
                    auto_full_backup_day           = db_backup_config.value.auto_full_backup_day
                    auto_full_backup_window        = db_backup_config.value.auto_full_backup_window
                    auto_incremental_backup_window = db_backup_config.value.auto_incremental_backup_window
                    backup_deletion_policy         = db_backup_config.value.backup_deletion_policy
                    dynamic "backup_destination_details" {
                      for_each = db_backup_config.value.backup_destination_details != null ? db_backup_config.value.backup_destination_details : []
                      content {
                        type = backup_destination_details.value.type
                      }
                    }
                    retention_period_days = db_backup_config.value.retention_period_days
                  }
                }
                db_version = properties.value.db_version
              }
            }
            tde_wallet_password = db_home.value.database.tde_wallet_password
          }
          db_version                  = db_home.value.db_version
          display_name                = db_home.value.display_name
          is_unified_auditing_enabled = db_home.value.is_unified_auditing_enabled
        }
      }
      dynamic "db_system_options" {
        for_each = properties.value.db_system_options != null ? [properties.value.db_system_options] : []
        content {
          storage_management = db_system_options.value.storage_management
        }
      }
      domain                       = properties.value.domain
      hostname_prefix              = properties.value.hostname_prefix
      initial_data_storage_size_gb = properties.value.initial_data_storage_size_gb
      license_model                = properties.value.license_model
      memory_size_gb               = properties.value.memory_size_gb
      node_count                   = properties.value.node_count
      private_ip                   = properties.value.private_ip
      reco_storage_size_gb         = properties.value.reco_storage_size_gb
      shape                        = properties.value.shape
      ssh_public_keys              = properties.value.ssh_public_keys
      dynamic "time_zone" {
        for_each = properties.value.time_zone != null ? [properties.value.time_zone] : []
        content {
          id = time_zone.value.id
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

