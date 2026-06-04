locals {
  aws_region = "us-east-1"
}

module "region_abbreviation" {
  source = "../../"
}

output "region_abbreviation" {
  value = module.region_abbreviation.aws_region_abbr_map[local.aws_region]
}

output "all_region_names" {
  value = module.region_abbreviation.region_names
}

output "all_abbreviations" {
  value = module.region_abbreviation.region_abbreviations
}
