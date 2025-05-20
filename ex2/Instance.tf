resource "aws_instance" "web" {
  ami                    = data.aws_ami.amiID.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.dove-key-pair.key_name
  security_groups = [ aws_security_group.dove_sg.name ]
  availability_zone      = "us-east-1a"

  tags = {
    Name    = "dove-app"
    Project = "Dove"
  }
}

resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state = "running"
}