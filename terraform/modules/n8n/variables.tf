variable "key_name" {}

variable "ami_id" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "security_group_name" {
  default = "n8n-sg"
}
