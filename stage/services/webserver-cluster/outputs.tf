output "alb_dns_name" {
  description = "DNS of the application load balancer"
  value       = module.webserver-cluster.alb_dns_name
}
