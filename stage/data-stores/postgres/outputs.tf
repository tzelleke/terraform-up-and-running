output "address" {
  description = "connection endpoint where database is reachable"
  value       = aws_db_instance.postgres.address
}

output "port" {
  description = "port on which database accepts connections"
  value       = aws_db_instance.postgres.port
}
