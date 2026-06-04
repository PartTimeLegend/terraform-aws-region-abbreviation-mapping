output "aws_region_abbr_map" {
  value       = var.aws_region_abbr_map
  description = "The canonical map of AWS region IDs to abbreviations."
}

output "lookup_region_abbreviation" {
  value       = local.aws_region_abbr_lookup_map
  description = "Map for looking up a region abbreviation from either the canonical region ID or a normalized lowercase name without hyphens."
}

output "region_names" {
  value       = keys(var.aws_region_abbr_map)
  description = "List of canonical AWS region IDs."
}

output "region_abbreviations" {
  value       = values(var.aws_region_abbr_map)
  description = "List of all region abbreviations."
}
