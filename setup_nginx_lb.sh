#!/bin/bash
sudo su
yum install -y nginx
systemctl start nginx
systemctl enable nginx

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