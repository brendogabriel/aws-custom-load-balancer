AWS High Availability Architecture: Custom Nginx Load Balancer
Este projeto demonstra a implementação de uma arquitetura de alta disponibilidade na AWS, utilizando instâncias EC2 e um balanceador de carga customizado.

🚀 O Diferencial deste Projetohttps://github.com/brendogabriel/aws-custom-load-balancer/blob/main/README.md
Diferente de implementações que utilizam apenas ferramentas nativas (clicáveis) da AWS, este projeto foi desenvolvido para contornar restrições administrativas de provisionamento de recursos (ALB) em contas novas.

A solução aplicada envolveu a configuração manual de um Load Balancer via Software (Nginx), demonstrando proficiência em administração de sistemas Linux, roteamento de tráfego e resolução de problemas (troubleshooting) em ambientes de nuvem.

🛠️ Tecnologias Utilizadas
Provedor de Nuvem: AWS (Amazon Web Services)

Instâncias: EC2 (Amazon Linux 2023)

Servidores Web: Apache (httpd)

Load Balancer: Nginx (configurado como Reverse Proxy)

Segurança: AWS Security Groups (Porta 80)

🏗️ Arquitetura da Solução
Web-Server-01 & 02: Duas instâncias rodando Apache com identificadores únicos para validação do balanceamento.

Custom-Load-Balancer: Uma instância dedicada rodando Nginx, configurada para distribuir o tráfego entre os servidores de backend utilizando o algoritmo de Round Robin.

💻 Implementação Técnica
Configuração dos Servidores de Backend (Apache)
Em cada servidor web, o ambiente foi preparado com o seguinte script:

Bash

sudo su
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Servidor 0X</h1>" > /var/www/html/index.html
Configuração do Load Balancer (Nginx)
O balanceador de carga foi configurado manualmente para gerenciar as requisições:

Bash

# Instalação do Nginx
yum install -y nginx
systemctl start nginx

# Configuração do Upstream e Proxy
cat <<EOF > /etc/nginx/conf.d/loadbalancer.conf
upstream servidores_backend {
    server 34.204.53.178:80;
    server 44.223.48.143:80;
}

server {
    listen 80;
    location / {
        proxy_pass http://servidores_backend;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

systemctl restart nginx

📈 Resultados
Através do IP público do Load Balancer, o tráfego é distribuído com sucesso. Ao atualizar a página, observa-se a alternância entre o Servidor 01 e o Servidor 02, garantindo que, caso um nó falhe, a aplicação permaneça disponível.

!(servidor1.png)
!(servidor2.png)
