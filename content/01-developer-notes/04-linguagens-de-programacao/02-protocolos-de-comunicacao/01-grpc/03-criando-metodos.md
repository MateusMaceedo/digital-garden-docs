---
title: "Criando metodos"
weight: 3
---


## Tipo de metodos GRPC

O gRPC permite definir quatro tipos de método de serviço:

---

#### RPCs unários

>  Em que o cliente envia uma única solicitação ao servidor e obtém uma única resposta, exatamente como uma chamada de função normal.

```java
rpc SayHello(HelloRequest) returns (HelloResponse);
```

---

#### RPCs de streaming de servidor

>  Em que o cliente envia uma solicitação ao servidor e obtém um stream para ler uma sequência de mensagens de volta. O cliente lê a partir do fluxo retornado até que não haja mais mensagens. O gRPC garante a ordem das mensagens em uma chamada RPC individual.

```java
rpc LotsOfReplies(HelloRequest) returns (stream HelloResponse);
```

---

#### RPCs de streaming de cliente

>  Em que o cliente grava uma sequência de mensagens e as envia ao servidor, novamente usando um fluxo fornecido. Depois que o cliente termina de escrever as mensagens, ele espera que o servidor as leia e retorne sua resposta. Mais uma vez, o gRPC garante a ordem das mensagens em uma chamada RPC individual.

```java
rpc LotsOfGreetings(stream HelloRequest) returns (HelloResponse);
```

---

#### RPCs de streaming bidirecional

> Em que ambos os lados enviam uma sequência de mensagens usando um fluxo de leitura e gravação. Os dois fluxos operam de forma independente, para que os clientes e servidores possam ler e escrever na ordem que quiserem: por exemplo, o servidor pode esperar para receber todas as mensagens do cliente antes de escrever suas respostas, ou pode alternativamente ler uma mensagem e depois escrever uma mensagem, ou alguma outra combinação de leituras e gravações. A ordem das mensagens em cada fluxo é preservada.

```java
rpc BidiHello(stream HelloRequest) returns (stream HelloResponse);
```


