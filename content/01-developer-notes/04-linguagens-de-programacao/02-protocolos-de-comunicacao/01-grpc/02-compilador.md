---
title: "Compilador local"
weight: 2
---

---

### Instalando compilador do protobuf

link: [Como posso instalar o protobuf no ubuntu 12.04?](https://qastack.com.br/ubuntu/532701/how-can-i-install-protobuf-in-ubuntu-12-04)

ou

```shell
sudo apt-get install libprotobuf-java protobuf-compiler
```

## Gerando codigo

```shell
protoc -I=$SRC_DIR --java_out=$DST_DIR $SRC_DIR/<file>.proto
```

- I - diretorio raiz do projeto
- java_out - Diretorio onde vai ser gerado o codigo
- Diretorio do arquivo proto
