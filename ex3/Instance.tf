resource "aws_instance" "web" {
  ami               = var.AMI_ID[var.REGION]
  instance_type     = var.INST_TYPE
  key_name          = aws_key_pair.dove-key-pair.key_name
  security_groups   = [aws_security_group.dove_sg.name]
  availability_zone = var.ZONE

  tags = {
    Name    = "dove-app"
    Project = "Dove"
  }
}

resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running"
}