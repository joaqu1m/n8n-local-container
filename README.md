### como refazer a infra do 0

- [gere um keypair](https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#CreateKeyPair:) com o nome "iagiliza-key"

- rode o projeto em um devcontainer para emular um linux com todas as libs disponíveis

- execute `./terraform/scripts/startup-modules-init.sh`

- insira as credenciais coletadas pelo "AWS Details" na interface de inicialização do lab (Ctrl + D para finalizar a inserção)
