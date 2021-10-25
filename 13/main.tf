provider "aws" {
  region = "ca-central-1"
}

locals {
  full_project_name = "${var.environment}-${var.project_name}"
  project_owner = "${var.owner} owner of ${var.project_name}"
}

data "aws_region" "current" {}
data "aws_availability_zones" "available" {}


locals {
  country = "Canada"
  cuty    = "Toronto"
  az_list join(",", {data.aws_availability_zones.available.names)
  region  : 
   - data.aws_region.current.description
  locaton = "In ${local.tregion} there are AZ:${local.az_list}"
}

resource "aws_eip" "static_ip" {
  tags = {
    Name  = "Static IP"
    Owner = var.owner
    Project = local.full_project_name
    Project_owner = local.
    region_azs = loacal/za_list
  }
}