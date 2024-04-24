---
title: "Comandos basicos"
weight: 2
---

---

```shell
#  Lista as tasks
gradle tasks

# Mostrar o help
gradle help --taks init

# Inicia um projeto
gradle init

# Executar o projeto
gradle run

# Executa os testes
gradle test

# Installar as dependencias
gradle build --scan

# Builda3 o projeto
gradle build

# Ver cobertura de testes
/app/build/reports/tests/test/index.html
```

---

## Jar

### Lista o conteudo do jar

```shell
jar tf app.jar
```

---

### Mostra o conteudo do arquivo manifest

```shell
# extrai manifest
jar xf app.jar META-INF/MANIFEST.MF

# exibe
cat META-INF/MANIFEST.MF
```

---

### Executa aplicação

```shell
java -jar app.jar
```
