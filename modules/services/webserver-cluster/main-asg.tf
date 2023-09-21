resource "aws_autoscaling_group" "webservers" {
  launch_configuration = aws_launch_configuration.webserver_instance.name
  vpc_zone_identifier  = data.aws_subnets.default.ids
  target_group_arns    = [aws_lb_target_group.asg.arn]
  health_check_type    = "ELB"

  min_size = 2
  max_size = 10

  tag {
    key                 = "Name"
    value               = var.cluster_name
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "webserver_instance" {
  image_id        = var.image_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.webserver.id]

  user_data = templatefile("${path.module}/user_data.sh", {
    server_port = var.server_port
    db_address  = var.db_address
    db_port     = var.db_port
  })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "webserver" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.all_ips
  }
}
