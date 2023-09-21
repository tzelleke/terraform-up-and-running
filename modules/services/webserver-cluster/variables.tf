variable "cluster_name" {
  description = "name of the cluster"
  type        = string
}

variable "image_id" {
  description = "ami id used for the cluster instances"
  type        = string
}

variable "instance_type" {
  description = "type of the cluster instances"
  type        = string
  default     = "t2.micro"
}

variable "db_address" {
  description = "address of the database"
  type        = string
}

variable "db_port" {
  description = "port on which database is listening"
  type        = number
}

variable "server_port" {
  description = "port on which server will listen"
  type        = number
  default     = 8080
}
