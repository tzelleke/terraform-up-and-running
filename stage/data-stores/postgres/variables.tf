variable "db_username" {
  description = "master user for postgres db"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "master password for postgres db"
  type        = string
  sensitive   = true
}

variable "project_name" {
  type    = string
  default = "terraform-up-and-running"
}
