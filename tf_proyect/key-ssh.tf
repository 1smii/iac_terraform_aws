resource "aws_key_pair" "terra-key" {
  key_name   = "terra-key"
  public_key = file("ssh-keys/terra_key.pem.pub")
}
