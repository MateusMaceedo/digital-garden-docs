---
title: "Circuit Breaker & Fallback Method"
weight: 2
---

Nesse estudo criei uma POC utilizando Resiliência com Kotlin, Redis e Wiremock.

O programa simula a consulta de uma API que retorna o objecto ``Bear``

```json

{
  "name": "Mateus Macedo",
  "weight": "100KG",
  "color": "yellow",
  "id:": "1010101010"
}
```

Então este é objeto é salvo no ``Redis``. Caso a aplicação apresente falha, a mesma procura o objeto dentro do Redis retornando caso ele exista.
