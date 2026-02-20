Projeto: Alta Disponibilidade com Nginx Load Balancer na AWS
📌 Visão Geral
Este projeto implementa uma infraestrutura web de alta disponibilidade na AWS, utilizando instâncias EC2 e um balanceador de carga customizado . O objetivo central foi garantir a resiliência do serviço através de uma solução de engenharia que contornou restrições de provisionamento de recursos nativos (ALB) .
+1

🛠️ Tecnologias Utilizadas

AWS (EC2): Provisionamento de múltiplas instâncias para redundância de computação .


Nginx: Implementação de Proxy Reverso e Load Balancer de Camada 7 .


Apache (httpd): Servidor web de backend para processamento de requisições HTTP .


Linux/Bash: Automação de deploy e configuração de serviços via terminal .

⚙️ Arquitetura

Instâncias Web Redundantes: Dois nós de backend rodando Apache para garantir tolerância a falhas .


Load Balancer Customizado: Instância dedicada rodando Nginx como ponto único de entrada .


Distribuição Round Robin: Configuração de upstream para alternância inteligente de tráfego entre os servidores .


Segurança de Rede: Implementação de Security Groups permitindo apenas tráfego HTTP na porta 80 .

📷 Prova de Conceito (PoC)
 ![Teste Servidor 01](Servidor1.png)

![Teste Servidor 02](Servidor2.png)
