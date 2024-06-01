---
title: "Spring Webflux"
weight: 2
---


Essas anotações borda um pouco sobre o módulo Spring Webflux que permite trabalhar com programação reativa em aplicações Java com Spring, usei em alguns projetos, para a melhoria da performance de alguns nanos serviços, que precisavam de um processamento maior de informações.

Para alguns testes, criei uma demo em Kotlin

Dependencias da necessarias, são:

- spring-boot-starter-webflux
- blockhound

```.gradle.kts
import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    id("org.springframework.boot") version "2.6.1"
    id("io.spring.dependency-management") version "1.0.11.RELEASE"
    kotlin("jvm") version "1.6.0"
    kotlin("plugin.spring") version "1.6.0"
}

group = "br.com.cardoso"
version = "0.0.1-SNAPSHOT"
java.sourceCompatibility = JavaVersion.VERSION_17

repositories {
    mavenCentral()
}

dependencies {
    implementation("org.springframework.boot:spring-boot-starter-webflux"){
        exclude(module = "spring-boot-starter-logging")
    }
    implementation ("org.springframework.boot:spring-boot-starter-log4j2")
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

```.Kotlin
package br.com.mateus.service

import br.com.mateus.web.WebTargetCustom
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
https://medium.com/@michellibrito/spring-webflux-f611c8256c53

O Spring Webflux não veio para substituir o Spring MVC. São maneiras diferentes de se construir aplicações web e cada uma tem seu propósito. Por isso, ao escolher entre uma ou outra, é preciso conhecer e definir o objetivo e necessidades da aplicação, para que assim, o melhor módulo seja utilizado.

Trabalhar com Spring WebFlux é recomendado por várias razões, especialmente em cenários onde a alta performance e a escalabilidade são cruciais.
