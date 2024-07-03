resource "aws_lb" "my_ld" {
    name = "testlb"
    internal = false
    load_balancer_type = "application"
    subnets = [var.subnet_id , var.subnet_id2]
    security_groups = [var.security_groups]
    tags = {
        name = "testlb"
    }
}

resource "aws_lb_target_group" "target_grp" {
    name = "test-grp"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id

    health_check {
      path = "/"
      port = "traffic-port"
    }
}

resource "aws_lb_target_group_attachment" "ins1" {
  target_group_arn = aws_lb_target_group.target_grp.arn
  target_id = var.ins1_pid
}

resource "aws_lb_target_group_attachment" "ins2" {
  target_group_arn = aws_lb_target_group.target_grp.arn
  target_id = var.ins2_pid
}

resource "aws_lb_listener" "lb_les" {
    load_balancer_arn = aws_lb.my_ld.arn
    port = 80
    protocol = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.target_grp.arn
    type = "forward"
  }
}