variable "region" {}
variable "access_key" {}
variable "secret_key" {}

variable "allocated" {
    description = "DB Size in GB"
    default     = "20"
}

variable "max_allocated" {
    description = "Max Autogrow DB Size in GB"
    default     = "100"
}

variable "engine_version" {
    description = "Version of the RDS Engine"
    default     = "8.0.39"
}

variable "db_user" {
    description = "DB User"
    default     = "admin"
}

variable "db_password" {
    description = "DB Password"
    sensitive   = true
    default     = "Password123?"
}

variable "apply_immediately" {
    description = "Apply Changes Immediately"
    default     = "true"
}

# Variable for security group IDs
variable "security_group_ids" {
  description = "Comma-separated list of security group IDs"
  type        = string
  default     = "[{\"id\":\"sg-12345678\"},{\"id\":\"sg-87654321\"}]"
}

# Local variable to transform the security group IDs
locals {
  security_groups = [for sg in jsondecode(var.security_group_ids) : sg.id]
}

# Local variable to split the security group IDs
#locals {
#  security_groups = split(",", var.security_group_ids)
#}
