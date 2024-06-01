resource "aws_launch_template" "Ltp" {
  name_prefix   = "Ltp"
  image_id      = "ami-0651a24cc46a968a0"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 4
  max_size           = 3
  min_size           = 1

  launch_template {
    id      = aws_launch_template.Ltp.id
    version = "$Latest"
  }
}