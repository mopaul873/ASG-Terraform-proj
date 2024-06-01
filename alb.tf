resource "aws_lb" "application-lb" {
  name                       = "application-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.sg2.id]
  subnets                    = [aws_subnet.pubsubaz1.id, aws_subnet.pubsubaz2.id, aws_subnet.pubsubaz3.id]
  enable_deletion_protection = false
  tags = {
    Environment = "application-lb"
    Name        = "application-lb"
  }

}

resource "aws_lb_target_group" "alb-target-group" {
  name     = "application-lb-tg"
  port     = 80
  protocol = "http"
  vpc_id   = aws_vpc.myvpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 10
    matcher             = 200
    path                = "/"
    port                = "traffic-port"
    protocol            = "http"
    timeout             = 6
    unhealthy_threshold = 3
  }

}

resource "aws_lb_target_group_attachment" "attach-server1" {
  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id        = aws_instance.webserver1.id
  port             = 80

}

resource "aws_lb_target_group_attachment" "attach-server2" {
  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id        = aws_instance.webserver2.id
  port             = 80

}

resource "aws_lb_listener" "alb-http-listener" {
  load_balancer_arn = aws_lb.application-lb.arn
  port              = 80
  protocol          = "http"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-target-group.arn
  }

}

resource "aws_eip" "eip" {
  
}

resource "aws_nat_gateway" "natgw"{
    allocation_id = aws_eip.eip.id
    subnet_id = aws_subnet.pubsubaz1.id

}
 
  







