provider "aws"{
    access_key = "AKIAVRZPLLHT2NFKFL7M"
    secret_key = "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"
    region     = "eu-central-1"
}

data "aws_availability_zones" "working" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_vpcs" "foo" {}
data "aws_vpc" "selected" {
    tags = {
        Name = "prod"
    }
}

resource "aws_subnet" "subnet-1"{
    vpc_id = data.aws_vpc.selected.id
    availability_zone = data.aws_availability_zones.working.names[0]
    cidr_block = "172.31.64.0/20"
    tags = {
        Name = "Subnet-1 in ${data.aws_availability_zones.working.names[0]}"
        Account = "Subnet in Account ${data.aws_caller_identity.current.account_id}"
        Region = data.aws_region.current.description
    }
}


output "data_aws_vpc"{
    value  = data.aws_vpc.selected.id
    }
output "data_aws_vpc_cidr"{
    value  = data.aws_vpc.selected.cidr_block
    }


output "data_aws_caller_identity"{
    value  = data.aws_caller_identity.current.account_id
    }

output "data_aws_availability_zones" {
    value  = data.aws_availability_zones.working.names
}

output "data_aws_region_name" {
    value  = data.aws_region.current.name
}

output "data_aws_region_description" {
    value  = data.aws_region.current.description
}

output "data_aws_vpcs" {
    value  = data.aws_vpcs.foo.ids
}



