resource "aws_accessanalyzer_analyzer" "unusedaccessanalyzer" {
  analyzer_name = var.unused_access_analyzer_name
  type          = "ORGANIZATION_UNUSED_ACCESS"
}
resource "aws_accessanalyzer_analyzer" "externalaccessanalyzer" {
  analyzer_name = var.external_access_analyzer_name
  type          = "ORGANIZATION"
}