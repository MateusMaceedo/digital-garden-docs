---
title: "Spring Webflux"
weight: 2
---

>Programação Reativa com Spring Boot, WebFlux e MongoDB

Essas anotações borda um pouco sobre o módulo Spring Webflux que permite trabalhar com programação reativa em aplicações Java com Spring, usei em alguns projetos, para a melhoria da performance de alguns nanos serviços, que precisavam de um processamento maior de informações.

Uma aplicação reativa deve ser: resiliente, elástica, responsiva e orientada à mensagem. Isso faz com que o modelo de desenvolvimento se torne completamente aderente em aplicações non-blocking que são assíncronas ou orientadas para eventos. Ao longo dos meus testes explorei algumas características da programação reativa com **Java** em uma abordagem bem prática. Partindo de um cenário simples, fui evoluindo até chegar em um cenario mais complexo. Para a demo, implementei codigo usando as tecnologias reativas do Spring Framework 5.

##### Paradigma Reativo
O paradigma reativo propõe um modelo diferente para o desenvolvedor, que passa a escrever o código de forma desacoplada, ou seja, os dados ficam isolados das rotinas que fazem a manipulação. O ***data stream*** (fluxo de dados) é um dos pontos-chave da programação reativa: ele representa um conjunto de dados, e os dados são os eventos. Imagine em fluxo do mundo real, algo que está em movimento e que gera reação em alguém. Do outro lado temos o subscriber, que é quem assina o evento, ou melhor, é quem reage ao evento. O subscriber nada mais é do que um conjunto de instruções, uma rotina que é acionada para tratar o evento (dado). Esse acionamento, que, na verdade, é a emissão do evento, fica transparente, sendo abstraído pelo framework. Você vai notar que frameworks reativos na verdade implementam e evoluem o design pattern [Observer](https://en.wikipedia.org/wiki/Observer_pattern)

Para alguns testes, criei uma demo em Kotlin

Dependencias da necessarias, são:

- spring-boot-starter-webflux
- blockhound

```groovy
import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    id("org.springframework.boot") version "2.6.1"
    id("io.spring.dependency-management") version "1.0.11.RELEASE"
    kotlin("jvm") version "1.6.0"
    kotlin("plugin.spring") version "1.6.0"
}

group = "br.com.mateus"
version = "0.0.1-SNAPSHOT"
java.sourceCompatibility = JavaVersion.VERSION_17

repositories {
    mavenCentral()
}

dependencies {
    implementation("org.springframework.boot:spring-boot-starter-webflux"){
        exclude(module = "spring-boot-starter-logging")
    }
    implementation("org.springframework.boot:spring-boot-starter-log4j2")
    implementation("com.fasterxml.jackson.module:jackson-module-kotlin")
    implementation("io.projectreactor.kotlin:reactor-kotlin-extensions")
    implementation("org.jetbrains.kotlin:kotlin-reflect")
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-reactor")
    testImplementation("org.springframework.boot:spring-boot-starter-test")
    testImplementation("io.projectreactor:reactor-test")

    //Blockhound
    implementation("io.projectreactor.tools:blockhound:1.0.6.RELEASE")
}

tasks.withType<KotlinCompile> {
    kotlinOptions {
        freeCompilerArgs = listOf("-Xjsr305=strict")
        jvmTarget = "11"
    }
}

tasks.withType<Test> {
    useJUnitPlatform()
}
```

##### Classe de serviço


```kotlin
package br.com.demo.service

import br.com.demo.web.WebTargetCustom
import org.springframework.core.env.Environment
import org.springframework.stereotype.Service
import reactor.core.publisher.Mono

@Service
class WebCallService(private val environment: Environment) {

    private val webTargetCustom = WebTargetCustom()

    fun call(): Mono<String> {
        val client = webTargetCustom.buildWebClient(getPort()!!)
        return client.get().uri("/test/get").retrieve().bodyToMono(String::class.java)
    }

    fun callPost(body: String): Mono<String> {
        val client = webTargetCustom.buildWebClient(getPort()!!)
        return client.post().uri("/test/post").body(Mono.just(body), String::class.java).retrieve()
            .bodyToMono(String::class.java)
    }

    fun blockCall(): Mono<String> {
        val client = webTargetCustom.buildBlockWebClient(getPort()!!)
        return client.get().uri("/test/get").retrieve().bodyToMono(String::class.java)
    }

    fun getPort() =
        if (System.getProperty("server.port") == null) environment.getProperty("server.port") else System.getProperty("server.port")
}
```

##### Execução

- Get: `curl localhost:8080/test/send`
- Post: `curl --location --request POST 'localhost:8080/test/send/post' \
        --header 'Content-Type: application/json' \
        --data-raw '{
          "teste": "valor_teste"
        }
        '`
- Com block: `curl localhost:8080/test/send/block`


##### Referencias
- https://medium.com/@michellibrito/spring-webflux-f611c8256c53
- https://docs.spring.io/spring-framework/reference/web/webflux.html
- https://medium.com/nstech/programa%C3%A7%C3%A3o-reativa-com-spring-boot-webflux-e-mongodb-chega-de-sofrer-f92fb64517c3

O Spring Webflux não veio para substituir o Spring MVC. São maneiras diferentes de se construir aplicações web e cada uma tem seu propósito. Por isso, ao escolher entre uma ou outra, é preciso conhecer e definir o objetivo e necessidades da aplicação, para que assim, o melhor módulo seja utilizado.

Trabalhar com Spring WebFlux é recomendado por várias razões, especialmente em cenários onde a alta performance e a escalabilidade são cruciais.

##### Leitura complementar
- [Projeto Reactor](http://bit.ly/2NT8zO8)
- [Documentação do webflux](http://bit.ly/2De1SlB)
- [Documentação do Spring Data MongoDB](http://bit.ly/2pkl07N)
- [Projeto RxJava](http://bit.ly/2PNzh88)
- [Projeto Netty](http://bit.ly/2NW6QYk)
