resource "aws_launch_configuration" "launchconfig-blue" {
  name_prefix     = "launchconfig-blue"
  image_id        = var.AMIS[var.AWS_REGION]
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.mykeypair-blue.key_name
  security_groups = [aws_security_group.myinstance-blue.id]
  user_data       = data.template_cloudinit_config.cloudinit-example.rendered
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "autoscaling-blue" {
  name                      = "autoscaling-blue"
  vpc_zone_identifier       = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
  launch_configuration      = aws_launch_configuration.launchconfig-blue.name
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers            = [aws_elb.elb-blue.name]
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "instance-blue"
    propagate_at_launch = true
  }
}