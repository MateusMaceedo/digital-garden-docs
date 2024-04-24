---
title: "Criando mensagens"
weight: 3
---

---

link: https://developers.google.com/protocol-buffers/docs/proto3

## Exemplo

```java
message SearchRequest {
  string query = 1;
  int32 page_number = 2;  // Which page number do we want?
  int32 result_per_page = 3;  // Number of results to return per page.
}
```

- os numero servem para definir a ordem dos dado na serialização para binario
- Caso remova um campo, e recomendado não usar o numero que ele pertecia, pois isso pode dar conflito no futuro, para garantir que isso o mesmo não seja usado vc pode marcalos como reserved (reservados / excluidos)

```java
message Foo {
  reserved 2, 15, 9 to 11;
  reserved "foo", "bar";
}
```

### Enums

```java
message SearchRequest {
  string query = 1;
  int32 page_number = 2;
  int32 result_per_page = 3;
  enum Corpus {
    UNIVERSAL = 0;
    WEB = 1;
    IMAGES = 2;
    LOCAL = 3;
    NEWS = 4;
    PRODUCTS = 5;
    VIDEO = 6;
  }
  Corpus corpus = 4;
}
// Usando alias para representar a mesma coisa 

message MyMessage1 {
  enum EnumAllowingAlias {
    option allow_alias = true;  // necessario deixar essa opção como true, senão vai dar erro, como abaixo
    UNKNOWN = 0;
    STARTED = 1;
    RUNNING = 1;
  }
}

message MyMessage2 {
  enum EnumNotAllowingAlias {
    UNKNOWN = 0;
    STARTED = 1;
    // RUNNING = 1;  // Uncommenting this line will cause a compile error inside Google and a warning message outside.
  }
}

//Observe que você não pode misturar nomes de campo e valores numéricos na mesma reservedinstrução.
```

### Tipos de Mensagem personalizados

```java
message SearchResponse {
  repeated Result results = 1; //o repeat dis que pode ser repetido os itens, semelhate a uma lista
}

message Result {
  string url = 1;
  string title = 2;
  repeated string snippets = 3;
}

// Tipo aninhado

message SearchResponse {
  message Result {
    string url = 1;
    string title = 2;
    repeated string snippets = 3;
  }
  repeated Result results = 1;
}

// chamdando tipo aninhado

message SomeOtherMessage {
  SearchResponse.Result result = 1;
}

// Exemplo de message aninhada

message Outer {                  // Level 0
  message MiddleAA {  // Level 1
    message Inner {   // Level 2
      int64 ival = 1;
      bool  booly = 2;
    }
  }
  message MiddleBB {  // Level 1
    message Inner {   // Level 2
      int32 ival = 1;
      bool  booly = 2;
    }
  }
}
```

caso a mensagem que queira colocar dentro da mensagem esteja em outro proto, vc pode importa-lo

### Importando

```java
import "myproject/other_protos.proto";
```


