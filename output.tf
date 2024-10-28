output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "vpc_security_group_ids" {
  value = var.security_group_ids
}
