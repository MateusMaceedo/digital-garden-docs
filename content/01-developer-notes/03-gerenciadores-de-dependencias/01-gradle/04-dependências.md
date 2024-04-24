---
title: "Dependências"
weight: 4
---

---

> - As dependências pode ser de dois tipos:
>   - como configurações do tipo **api** - que serão expostas transitivamente aos consumidores da biblioteca e, como tal, aparecerão no classpath de compilação dos consumidores
>   - como configuração do tipo **implementation** que, por outro lado, não serão expostas aos consumidores e, portanto, não vazarão para o classpath de compilação dos consumidores

```groovy
dependencies {
    api 'org.apache.httpcomponents:httpclient:4.5.7'
    implementation 'org.apache.commons:commons-lang3:3.5'
}
```

**OBS:** As configurações **compile** e **runtime** foram removidas com o Gradle 7.0. Consulte o guia de atualização como migrar para implementatione apiconfigurações.
    - **compile** --> implementation 
    - **runtime** --> api



> Prefira a configuração de implementation em vez de api quando possível.


