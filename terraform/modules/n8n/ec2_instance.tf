resource "aws_instance" "n8n" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  security_groups = [aws_security_group.n8n_sg.name]

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }

  tags = {
    Name = "n8n-ec2"
  }

  user_data = file("./modules/n8n/user_data.sh")
}

output "n8n_public_ip" {
  value = aws_instance.n8n.public_ip
}
