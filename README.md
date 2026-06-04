# Terraform AWS Region Abbreviation Mapping

[![Tag](https://github.com/PartTimeLegend/terraform-aws-region-abbreviation-mapping/actions/workflows/tag.yml/badge.svg)](https://github.com/PartTimeLegend/terraform-aws-region-abbreviation-mapping/actions/workflows/tag.yml)

A simple module that provides mappings between AWS region IDs and standardized abbreviations for consistent resource naming.

## Features

- Mapping of AWS region IDs to short abbreviations
- Supports both canonical region IDs and normalized lowercase names without hyphens
- Helper output map to simplify regional naming across AWS resources
- Zero external dependencies

## Usage

### Basic Usage

```terraform
locals {
  aws_region = "us-east-1"
}

module "region_abbreviation_mapping" {
  source  = "PartTimeLegend/region-abbreviation-mapping/aws"
  version = "~> 1.0" # Replace with the latest version
}

output "region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.aws_region]
}
```

### Using Normalized Region IDs

```terraform
module "region_abbreviation_mapping" {
  source = "PartTimeLegend/region-abbreviation-mapping/aws"
}

locals {
  canonical_region  = "ap-southeast-2"
  normalized_region = "apsoutheast2"
}

output "canonical_region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.canonical_region]
}

output "normalized_region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.normalized_region]
}
```

### Using the Region Lookup Map

```terraform
module "region_abbreviation_mapping" {
  source = "PartTimeLegend/region-abbreviation-mapping/aws"
}

locals {
  resource_name = "${module.region_abbreviation_mapping.lookup_region_abbreviation["us-east-1"]}-app"
}
```

## Available Outputs

| Name | Description |
|------|-------------|
| `aws_region_abbr_map` | Canonical map of AWS region IDs to their abbreviations |
| `lookup_region_abbreviation` | Lookup map supporting canonical region IDs and normalized lowercase names without hyphens |
| `region_names` | List of canonical AWS region IDs |
| `region_abbreviations` | List of all region abbreviations |

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
