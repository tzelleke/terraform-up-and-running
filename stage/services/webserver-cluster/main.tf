terraform {
  backend "s3" {
    key            = "terraform-up-and-running/stage/services/webserver-cluster/terraform.tfstate"
    region         = "eu-central-1"
    bucket         = "com-tzelleke-terraform-state"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

module "webserver-cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name  = "${var.project_name}-webserver-stage"
  image_id      = "ami-04e601abe3e1a910f"
  instance_type = "t2.micro"
  db_address    = data.terraform_remote_state.db.outputs.address
  db_port       = data.terraform_remote_state.db.outputs.port
}
