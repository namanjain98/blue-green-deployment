output "ELB" {
  value = aws_elb.elb-blue.dns_name
}
