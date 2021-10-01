variable "region" {
    description = "Please Enter AWS Region to deploy Server"
    type        = string
    default     = "eu-central-1"
}

variable "instance_type" {
    description = "Enter Instance Type"
    type        = string
    default     = "t2.micro"
}

variable "allow_ports" {
    description = "List of Ports to open for server"
    type = list
    default     = ["80", "443", "22", "8080"]
}

variable "enable_detailed_monitoring" {
    type = bool
    default = false
}

variable "common-tags" {
  type = map
  description = "Common tags to apply to all resources"
  default = {
    Owner      = "Vadim"
    Project    = "Lead"
    CostCenter = "12345"
    Environment = "development"
  }
}
