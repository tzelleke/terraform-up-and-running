data "terraform_remote_state" "db" {
  backend = "s3"

  config = {
    bucket = "com-tzelleke-terraform-state"
    key    = "terraform-up-and-running/stage/data-stores/postgres/terraform.tfstate"
    region = "eu-central-1"
  }
}
