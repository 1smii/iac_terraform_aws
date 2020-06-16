resource "aws_launch_configuration" "web" {
  name_prefix = "web-"

  image_id        = var.amii_id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.terra-key.id
  security_groups = [aws_security_group.allow_http.id, aws_security_group.allow_ssh_icmp_private.id]
 
  lifecycle {
    create_before_destroy = true
  }
}





