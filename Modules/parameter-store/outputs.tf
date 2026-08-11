output "parameters_arn_map" {
  description = "parameter store ids map"
  value       = try({ for key, parameter in module.parameters : key => parameter.ssm_parameter_arn }, {})
}


output "parameters_name_map" {
  description = "parameter store name map"
  value       = try({ for key, parameter in module.parameters : key => parameter.ssm_parameter_name }, {})
}

output "parameters_value_map" {
  description = "parameter store value map"
  value       = try({ for key, parameter in module.parameters : key => parameter.ssm_parameter_value }, {})
}
