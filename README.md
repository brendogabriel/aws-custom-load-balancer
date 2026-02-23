# Projeto: Balanceador de Carga e Proxy Reverso (Nginx/AWS)

## 📌 Visão Geral
Este projeto demonstra a implementação de uma arquitetura de alta disponibilidade na AWS, utilizando instâncias EC2 e um balanceador de carga customizado. O objetivo principal é garantir a resiliência e a continuidade do serviço através da distribuição inteligente de tráfego.

### 🚀 O Diferencial deste Projeto
Diferente de implementações que utilizam apenas ferramentas nativas (clicáveis) da AWS, este projeto foi desenvolvido para contornar restrições administrativas de provisionamento de recursos (ALB) em contas novas. A solução aplicada envolveu a configuração manual de um Load Balancer via Software (Nginx), demonstrando proficiência em administração de sistemas Linux, roteamento de tráfego e resolução de problemas (troubleshooting) em ambientes de nuvem.

## 🛠️ Tecnologias Utilizadas
* **AWS** (EC2, Security Groups)
* **Nginx** (Reverse Proxy e Load Balancer)
* **Apache** (Servidor Web httpd)
* **Linux/Bash** (Scripts de automação)

## ⚙️ Arquitetura
1. **Web-Server-01 & 02:** Duas instâncias rodando Apache com identificadores únicos para validação do balanceamento.
2. **Custom-Load-Balancer:** Uma instância dedicada rodando Nginx, configurada para distribuir o tráfego entre os servidores de backend utilizando o algoritmo de Round Robin.
3. **Segurança:** Configuração de Security Groups para permitir apenas tráfego HTTP na porta 80.
4. **Resiliência:** Estrutura desenhada para manter a aplicação online mesmo em caso de falha de um dos nós de processamento.

## 💻 Implementação Técnica

### Configuração dos Servidores de Backend (Apache)
```bash
sudo su
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Servidor 0X</h1>" > /var/www/html/index.html
```

### Configuração do Load Balancer (Nginx)
```bash
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
```

## 📸 Prova de Conceito (PoC)
![Teste Servidor 01](Servidor1.png)
![Teste Servidor 02](Servidor2.png)
