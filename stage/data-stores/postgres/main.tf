terraform {
  backend "s3" {
    key            = "terraform-up-and-running/stage/data-stores/postgres/terraform.tfstate"
    region         = "eu-central-1"
    bucket         = "com-tzelleke-terraform-state"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

resource "aws_db_instance" "postgres" {
  identifier_prefix   = "${var.project_name}-"
  engine              = "postgres"
  allocated_storage   = 10
  instance_class      = "db.t4g.micro"
  skip_final_snapshot = true
  db_name             = "postgres"

  username = var.db_username
  password = var.db_password
}
