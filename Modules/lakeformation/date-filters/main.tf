# Grant permissions to the Data lake permissions
resource "aws_lakeformation_permissions" "example" {
  for_each = toset(var.principals)
  principal   = each.value
  permissions = ["CREATE_TABLE", "ALTER", "DROP"]
  database {
    name       = var.database_name
    catalog_id = var.table_catalog_id
  }
}

# Create the data cells filter
resource "aws_lakeformation_data_cells_filter" "example" {
  table_data {
    database_name    = var.database_name
    name             = var.data_cells_filter_name
    table_catalog_id = var.table_catalog_id
    table_name       = var.table_name
    column_wildcard {
        excluded_column_names = []
    }
    row_filter {
      filter_expression = var.filter_expression
    }
  }
}
