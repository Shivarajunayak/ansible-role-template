variable "database_name" {
  description = "The name of the database"
  type        = string
}
variable "data_cells_filter_name" {
  description = "The name of the data cells filter"
  type        = string
}
variable "table_catalog_id" {
  description = "The catalog ID of the table"
  type        = string
}
variable "table_name" {
  description = "The name of the table"
  type        = string
}
variable "filter_expression" {
  description = "The filter expression for the data cells filter"
  type        = string
}
variable "principals" {
  description = "The principals for the data Grant data lake permissions"
  type    = list(string)
}