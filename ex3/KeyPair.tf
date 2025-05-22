resource "aws_key_pair" "dove-key-pair" {
  key_name   = "dove-key-pair"
  public_key = var.instance_public_key
}