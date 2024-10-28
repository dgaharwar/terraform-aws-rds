resource "aws_db_instance" "default" {
  username                  = var.db_user
  password                  = var.db_password
  vpc_security_group_ids    = local.security_groups
  allocated_storage         = var.allocated
  max_allocated_storage     = var.max_allocated
  storage_type              = "gp2"
  engine                    = "mysql"
  engine_version            = var.engine_version
  instance_class            = "db.t2.micro"
  parameter_group_name      = "default.mysql5.7"
  apply_immediately         = var.apply_immediately
  final_snapshot_identifier = "mysql-backup"
  skip_final_snapshot       = true

  tags = {
    Name = "MyRDSInstance"
  }
}
