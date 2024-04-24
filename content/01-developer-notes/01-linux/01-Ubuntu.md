---
title: "Ubuntu"
weight: 2
---

### Custumização

##### Fontes

```shell
# hack para terminal
sudo apt install fonts-hack-ttf -y

# Fira code
sudo apt install fonts-firacode 
```





### APT

---

##### Configuração ao apt-get ( /etc/apt )

```shell
cat /etc/apt/sources.conf
```

---

##### Cache do apt

```shell
ls /var/cache/apt/archives
```

---

##### Lista de repositórios

```shell
ls /var/lib/apt/lists
```

---

##### Comando apt-get

```shell
apt-get option nome_do_pacote
```

Options:

- **update**​ - Obter novas listas de pacotes
- **upgrade**​ - Executar uma atualização de pacotes já instalados
- **install** ​ - Instalar novos pacotes (o pacote é libc6 e nao libc6.deb)
- **remove** ​ - Remover pacotes
- **autoremove** ​ - Remover automaticamente todos os pacotes não utilizados
- **purge** ​ - Remover pacotes de configuração
- **source**​ - Fazer o download de arquivos de código-fonte
- **dist-upgrade** ​ - Atualiza a distribuição
- **clean** ​ – Apagar arquivos obtidos por download
- **autoclean** ​ – Apagar arquivo antigos obtidos por download
- **-d​ - download** - Obter o pacote binário

---

##### Busca pacotes

```shell
apt-cache search pacote
apt-cache depends pacote
```



---

---

### Performace

> O pré-carregamento é um daemon que é executado em segundo plano e analisa o comportamento do usuário e executa aplicativos com freqüência. Abra um terminal e use o seguinte comando para instalar o pré-carregamento

```shell
sudo apt-get install preload
```


