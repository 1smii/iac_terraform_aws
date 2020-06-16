resource "aws_instance" "remote" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.allow_ssh.id, aws_security_group.allow_icmp.id]
  subnet_id       = aws_subnet.public-subnet1.id
  key_name        = aws_key_pair.terra-key.id
  user_data       = file("scripts/update_mysql.sh")

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("ssh-keys/terra_key.pem")
    host        = aws_instance.remote.public_ip
  }
  provisioner "file" {
    source      = "ssh-keys"
    destination = "/home/ubuntu"
  }
  provisioner "file" {
    source      = "databases"
    destination = "/home/ubuntu"
  }
  provisioner "file" {
    source      = "scripts"
    destination = "/home/ubuntu"
  }

  tags = {
    Name = "Remote ec2"
  }
}
