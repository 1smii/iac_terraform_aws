resource "aws_opsworks_stack" "mainstack" {
  name                         = "php_apache2_stack"
  region                       = var.region
  vpc_id                       = aws_vpc.mainvpc.id
  default_subnet_id            = aws_subnet.public-subnet1.id
  default_os                   = "Ubuntu 14.04 LTS"
  default_ssh_key_name         = aws_key_pair.terra-key.id
  use_custom_cookbooks         = true
  service_role_arn             = "arn:aws:iam::aws:policy/AdministratorAccess"
  default_instance_profile_arn = "arn:aws:iam::373908213107:role/aws-opsworks-ec2-role"


  custom_cookbooks_source {
    type = "Git"
    url  = "https://github.com/1smii/chef_cookbooks.git"
  }

  color                        = "yellow"
  use_opsworks_security_groups = true
}

resource "aws_opsworks_custom_layer" "mainlayer" {
  name                  = "PHP-apache2 layer"
  short_name            = "PHP-apache2"
  stack_id              = aws_opsworks_stack.mainstack.id
  elastic_load_balancer = aws_elb.web_elb.id
}

resource "aws_opsworks_instance" "apache2-instance" {
  stack_id = aws_opsworks_stack.mainstack.id
  layer_ids = [aws_opsworks_custom_layer.mainlayer.id]
}