resource "aws_security_group" "terraform_runner_sg" {
  name = "terraform-runner-sg"

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

  tags = {
    Name = "terraform-runner-sg"
  }
}

resource "aws_iam_instance_profile" "terraform_runner_profile" {
  name = "terraform-runner-profile"
  role = var.iam_role_id
}

resource "aws_instance" "terraform_runner" {
  instance_type        = "t3.micro"
  key_name             = aws_key_pair.terraform_runner_key.key_name
  ami                  = var.ami_id
  security_groups      = [aws_security_group.terraform_runner_sg.name]
  iam_instance_profile = aws_iam_instance_profile.terraform_runner_profile.name

  // TODO: Setup automático da máquina com CI/CD para rodar terraform. Isso inclui possivelmente criar e instanciar um serviço com Jenkins
  // Esperando aprovação do tema e definição do nome da org para prosseguir;

  tags = {
    Name        = "terraform-runner"
    Environment = "management"
    Managed-by  = "terraform"
  }

  user_data = file("${path.module}/user_data.sh")
}
