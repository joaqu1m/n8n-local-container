resource "aws_security_group" "n8n_sg" {
  name = "n8n_sg"

  ingress {
    from_port   = 5678
    to_port     = 5678
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "n8n" {
  ami           = var.ami_id
  key_name      = var.key_name
  instance_type = "t2.micro"

  security_groups = [aws_security_group.n8n_sg.name]

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }

  tags = {
    Name = "n8n-ec2"
  }

  user_data = templatefile("./modules/n8n/user_data.sh.tpl", {
    n8n_public_ip = aws_eip.n8n_eip.public_ip
  })
}

resource "aws_eip" "n8n_eip" {
  instance = aws_instance.n8n.id
}

output "n8n_public_ip" {
  value = aws_instance.n8n.public_ip
}

output "n8n_elastic_ip" {
  value = aws_eip.n8n_eip.public_ip
}
