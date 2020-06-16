output "elb_ip" {
  value = aws_elb.web_elb.dns_name
}

output "remote_ip" {
  value = aws_instance.remote.public_ip
}

# DB Outputs
output "db_endpoint" {
  value = aws_db_instance.main-rds.endpoint
}

output "db_name" {
  value = aws_db_instance.main-rds.name
}
