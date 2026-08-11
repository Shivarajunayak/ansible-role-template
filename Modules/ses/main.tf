module "ses" {
  source   = "./aws-ses"
  for_each = var.parameters

  domain                             = try(each.value.domain, null)
  zone_id                            = try(each.value.zone_id, null)
  verify_dkim                        = try(each.value.verify_dkim, false)
  verify_domain                      = try(each.value.verify_domain, false)
  create_spf_record                  = try(each.value.create_spf_record, false)
  custom_from_subdomain              = try(each.value.create_spf_record, [])
  custom_from_behavior_on_mx_failure = try(each.value.custom_from_behavior_on_mx_failure, "UseDefaultValue")
  enabled                            = try(each.value.enabled, false)
  namespace                          = try(each.value.namespace, null)
  tenant                             = try(each.value.tenant, null)
  environment                        = try(each.value.environment, null)
  stage                              = try(each.value.stage, null)
  name                               = try(each.value.name, null)
  delimiter                          = try(each.value.delimiter, null)
  attributes                         = try(each.value.attributes, [])
  tags                               = try(each.value.tags, {})
  additional_tag_map                 = try(each.value.additional_tag_map, {})
  label_order                        = try(each.value.label_order, [])
  regex_replace_chars                = try(each.value.regex_replace_chars, null)
  id_length_limit                    = try(each.value.id_length_limit, null)
  label_key_case                     = try(each.value.label_key_case, null)
  label_value_case                   = try(each.value.label_value_case, null)
  descriptor_formats                 = try(each.value.descriptor_formats, {})
  labels_as_tags                     = try(each.value.labels_as_tags, [])
}
