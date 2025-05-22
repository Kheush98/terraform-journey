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

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  connection {
    type        = "ssh"
    user        = var.USER
    host        = self.public_ip
    private_key = file("dove")
  }

  provisioner "remote-exec" {
    inline = ["chmod +x /tmp/web.sh", "sudo /tmp/web.sh"]
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ip.txt" #Save instance private's ip in private_ip.txt file in local
  }
}

resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running"
}


output "public_ip" {
  description = "Instance Public ip"
  value       = aws_instance.web.public_ip
}

