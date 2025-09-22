variable "db_name" {
  type        = string
  description = "Database name"
}

variable "db_user" {
  type        = string
  description = "Database username"
}

variable "db_pass" {
  type        = string
  description = "Database password"
}

resource "aws_db_instance" "db" {
  identifier        = var.db_name
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  username          = var.db_user
  password          = var.db_pass
  allocated_storage = 20
  skip_final_snapshot = true
}

output "db_endpoint" {
  value = aws_db_instance.db.address
}
