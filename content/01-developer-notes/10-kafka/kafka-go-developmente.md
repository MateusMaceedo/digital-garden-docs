---
title: "Kafka: Kafka com Go"
weight: 2
---

>Aqui deixo os meus estudos e ideias, com Kafka e Golang, na maioria das vezes, os meus testes com Kafka tem sido usando a linguagem Go.

##### Kafka Consumer Golang

Essa demo usa a lib ```confluent-kafka-go``` para consumir mensagens do kafka. Para executar o projeto, execute ```go run main.go```.

##### Kafka Producer Golang

Essa demo usa a lib ```confluent-kafka-go``` para producer mensagens no kafka. Para executar o projeto, execute ```go run main.go```.

##### GCP Pub/Sub com Golang

Essa demor, possui dois módulos: ```pub``` e ```sub```. O módulo ```pub``` é responsável por publicar mensagens em um tópico. O módulo sub é responsável por assinar um tópico e receber mensagens. Tudo usando o ```Google Pub/Sub```.

>Como usar?

Primeiro é necessario fazer o build de ambos os módulos:

```bash
go build -C pub
go build -C sub
```

Agora podemos produzir mensagens:
```bash
./pub/pub --projectid {NOME DO SEU PROJETO GCP} --topic test --msg "minha primeira mensagem"
```

E para consumir:
```bash
./sub/sub --projectid {NOME DO SEU PROJETO GCP} --topic test --subid subtest
```

Lembre de substituir **{NOME DO SEU PROJETO GCP}** pelo nome do seu projeto GCP e executar os comandos acima em terminais separados para que você consiga ver as mensagens sendo produzidas e consumidas ao mesmo tempo.

##### Kafka Broker With Prometheus JMX Exporter

Essa demo, contém configurações para monitoria do Kafka usando o Prometheus + Grafana, como JMX Exporter.

Para rodar basta rodar: ```docker-compose up -d```

##### Kafka Go Producer/Consumer using Schema Registry

Essa demo contém um exemplo de código para consumir e produzir usando schema registry. Para usá-lo você precisa dos comandos abaixo:

```bash
docker-compose up -d
go run main.go
```

##### Demo to use AWS Rekognition in Go

Essa demo, contém configurações com ***Rekognition*** em ***Go***, para analisar um grande volume de imagens e mensagens, que foram processadas.
