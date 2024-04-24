---
title: "Proxy reverso"
weight: 4
---

---

- 1º Desabilite o Default Virtual Host

```shell
sudo unlink /etc/nginx/sites-enabled/default
```

- 2º Crie o Proxy Reverso Nginx

```shell
# Criando arquivo
touch etc/nginx/sites-available/reverse-proxy.conf


# Edite 
code etc/nginx/sites-available/reverse-proxy.conf
# sudo nano etc/nginx/sites-available/reverse-proxy.conf


# Adicione 

server {
    listen 80;
    location / {
        proxy_pass http://192.x.x.2; # redireciona o que vem para esse ip
    }

}
```

- 3º Ative a configuração

```shell
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
```

- 4º  Teste o Nginx o Proxy Reverso Nginx

```shell
service nginx configtest
```

- 5º Reinicie o serviço

```shell
systemctl restart nginx
# ou
sudo service nginx restart
```
