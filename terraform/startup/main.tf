provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "local" {
    path = "./terraform-state/terraform.tfstate"
  }
}

resource "aws_instance" "terraform_runner" {
  instance_type = "t3.micro"
  key_name      = "iagiliza-key"
  ami           = "ami-08b5b3a93ed654d19" // Amazon Linux 2023 AMI

  // TODO: Setup automático da máquina com CI/CD para rodar terraform. Isso inclui possivelmente criar e instanciar um serviço com Jenkins
  // Esperando aprovação do tema e definição do nome da org para prosseguir;

  tags = {
    Name = "TerraformRunner"
  }
}

output "terraform_runner_public_ip" {
  value = aws_instance.terraform_runner.public_ip
}
