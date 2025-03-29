### como refazer a infra do 0

- rode o projeto em um devcontainer para emular um linux com todas as libs necessárias e credenciais isoladas

- insira as credenciais da AWS no arquivo ./terraform/aws.env (existe um arquivo aws.env.example mostrando o formato do arquivo). se estiver em um lab de estudo, as credenciais mudam a cada reinicialização

- execute `./terraform/scripts/startup-modules-init.sh`
