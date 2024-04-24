---
title: "Instalando novo site"
weight: 3
---

 

- 1º Passo - Crie um novo diretório

```shell
## Do site estatico
# mkdir -p /var/www/<nome-site>/public_html
mkdir -p /var/www/unisite.com/public_html
```

- 2º Crie as pastas de logs

```shell
# mkdir /var/log/nginx/<nome-site>/
mkdir /var/log/nginx/unisite.com/
```

- 3º Concenda premissão

```shell
# sudo chown -R www-data:www-data /var/www/<nome-site>/public_html
sudo chown -R www-data:www-data /var/www/unisite.com/public_html

# todos estejam aptos a ler seus arquivos. Para isso, utilize o comando abaixo:
# sudo chmod 755 /var/www
```

- 4º Passo - mova o site pra pasta

```shell
# cp -r /<path-do-site>/* /var/www/<nome-site>/public_html
```

- 5º Passo - Crie um novo arquivo de Host Virtual

```shell
# sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/<nome-site>
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/unisite.com
```

- 6º Passo - Configurando Virtual Hosts

```shell
# code /etc/nginx/sites-available/<nome-site>
#  sudo nano /etc/nginx/sites-available/<nome-site>
code /etc/nginx/sites-available/unisite.com



# Add os itens abaixo

 server {
        listen   80; ## listen for ipv4; this line is default and implied
        #listen   [::]:80 default ipv6only=on; ## listen for ipv6

        # root /var/www/<nome-site>/public_html;
        root /var/www/unisite.com/public_html;
        index index.html index.htm;


       # access_log   /var/log/nginx/<nome-site>/access.log;
        access_log   /var/log/nginx/ unisite.com/access.log;
       # error_log    /var/log/nginx/<nome-site>/error.log;
        error_log    /var/log/nginx/ unisite.com/error.log;

        # Make site accessible from http://localhost/
        # server_name <nome-site>;
        server_name unisite.com;
}
```

- 7º Cronfigure o site com enable

```shell
# sudo ln -s /etc/nginx/sites-available/<nome-site> /etc/nginx/sites-enabled/<nome-site>
sudo ln -s /etc/nginx/sites-available/unisite.com /etc/nginx/sites-enabled/ unisite.com


# Desabilite o Default Virtual Host
sudo unlink /etc/nginx/sites-enabled/default
```

- 8º Reinicie o serviço

```shell
systemctl restart nginx
# ou
sudo service nginx restart
```

- 9º Configurando hosts locais

```shell
nano /etc/hosts 


#Virtual Hosts 
localhost    www.example.com 
```

- 10º Vendo logs

```shell
# Logs de acesso default
tail /var/log/nginx/access.log -f
# personalizado
# tail /var/log/nginx/<nome-site>/access.log -f
tail /var/log/nginx/unisite.com/access.log -f


# Erros default
tail /var/log/nginx/error.log
# personalizado
# tail /var/log/nginx/<nome-site>/error.log
tail /var/log/nginx/unisite.com/error.log
```
