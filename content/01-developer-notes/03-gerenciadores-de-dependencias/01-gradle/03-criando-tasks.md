---
title: "Definindo tasks"
weight: 3
---

---

```groovy
tasks.register('teste') {
    println 'Hello world'
}

tasks.register('hello') {
    doLast {
        println 'Hello world!'
    }
}
```

-  Executando task

```groovy
gradle -q teste 
-ou
gradle teste // mostra status da execução
```

---

## Scripts em tasks

link: https://docs.gradle.org/current/userguide/tutorial_using_tasks.html#sec:projects_and_tasks

### Basico

```groovy
tasks.register('upper') {
    doLast {
        String someString = 'mY_nAmE'
        println "Original: $someString"
        println "Upper case: ${someString.toUpperCase()}"
    }
}


// exemplo de repetição
tasks.register('count') {
    doLast {
        4.times { print "$it " }
    }
}
```

- Executando 

```shell
gradle upper
```

### Tasks sequencial

```groovy
tasks.register('taskX') {
    dependsOn 'taskY'
    doLast {
        println 'taskX'
    }
}
tasks.register('taskY') {
    doLast {
        println 'taskY'
    }
}
```

- Executando 

```shell
gradle taskX

# mostrar a execução das duas tasks, pois a taskX depende da taskY
```

### Alterando conportamento de uma task

```groovy
tasks.register('hello') {
    doLast { // definie a ordem de execução
        println 'Hello Earth'
    }
}
tasks.named('hello') {
    doFirst {  // defini a orde de execução 
        println 'Hello Venus'
    }
}
tasks.named('hello') {
    doLast {
        println 'Hello Mars'
    }
}
tasks.named('hello') {
    doLast {
        println 'Hello Jupiter'
    }
}
```

- Executando 

```shell
gradle -q hello
#saida
#Olá Vênus
#Olá terra
#Olá marte
#Ola jupiter
```

https://docs.gradle.org/current/userguide/plugins.html#plugins
 |
  --> Aplicando plug-ins com o DSL de plug-ins


