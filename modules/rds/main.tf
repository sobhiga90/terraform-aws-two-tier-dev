resource "aws_db_subnet_group" "main" {
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "mysql" {
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  username            = "admin"
  password            = "Password123!"
  skip_final_snapshot = true

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.db_sg]
}