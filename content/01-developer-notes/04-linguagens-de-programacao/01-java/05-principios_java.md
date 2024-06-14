---
title: "Principios do Java"
weight: 3
---

>Conceitos que geralmente são questionados em entrevistas

#### Sintaxe básica
- Variáveis
```java
int count = 10;             // Tipo primitivo
String message = "Hello";   // Referência a objeto
```
- **Tipos primitivos**
  - **1. Inteiros**
    - **byte**
      - Tamanho: 8 bits
      - Valor mínimo: -128
      - Valor máximo: 127
      - ***Exemplo: byte b = 100;***
    - **short**
      - Tamanho: 16 bits
      - Valor mínimo: -32,768
      - Valor máximo: 32,767
      - ***Exemplo: short s = 10000;***
    - **int**
      - Tamanho: 32 bits
      - Valor mínimo: -2^31 (-2,147,483,648)
      - Valor máximo: 2^31-1 (2,147,483,647)
      - ***Exemplo: int i = 100000;***
    - **long**
      - Tamanho: 64 bits
      - Valor mínimo: -2^63 (-9,223,372,036,854,775,808)
      - Valor máximo: 2^63-1 (9,223,372,036,854,775,807)
      - ***Exemplo: long l = 100000L;***

  - **2. Ponto Flutuante**
      - **float**
        - Tamanho: 32 bits
        - Valor mínimo: Aproximadamente 1.4E-45
        - Valor máximo: Aproximadamente 3.4E+38
        - Precisão: Aproximadamente 6-7 dígitos decimais significativos
        - ***Exemplo: float f = 234.5f;***

      - **double**
        - Tamanho: 64 bits
        - Valor mínimo: Aproximadamente 4.9E-324
        - Valor máximo: Aproximadamente 1.7E+308
        - Precisão: Aproximadamente 15 dígitos decimais significativos
        - ***Exemplo: double d = 123.4;***

  - **3. Tipo Caractere**
      - **char**
        - Tamanho: 16 bits
        - Valor: Representa um único caractere Unicode
        - Valor mínimo: '\u0000' (ou 0)
        - Valor máximo: '\uffff' (ou 65,535)
        - ***Exemplo: char c = 'A';***

  - **4. Tipo Booleano**
      - **boolean**
        - Tamanho: Não especificado precisamente (depende da implementação da JVM)
        - Valores possíveis: true e false
        - ***Exemplo: boolean bool = true;***

- ***Exemplo de Uso dos Tipos Primitivos***
```java
public class PrimitiveTypesExample {
    public static void main(String[] args) {
        byte byteVar = 100;
        short shortVar = 10000;
        int intVar = 100000;
        long longVar = 100000L;
        float floatVar = 234.5f;
        double doubleVar = 123.4;
        char charVar = 'A';
        boolean boolVar = true;

        System.out.println("byte: " + byteVar);
        System.out.println("short: " + shortVar);
        System.out.println("int: " + intVar);
        System.out.println("long: " + longVar);
        System.out.println("float: " + floatVar);
        System.out.println("double: " + doubleVar);
        System.out.println("char: " + charVar);
        System.out.println("boolean: " + boolVar);
    }
}

```
- Condicionais
```java

```
- Vetor
```java

```
- ArrayList
```java

```
- Loops
```java

```
- Castings
```java

```
- Declaração de Classes
```java
// Classes são a unidade básica de estrutura em Java. Elas encapsulam dados e comportamentos.
public class MyClass {
    // Variáveis de instância
    int number;
    String text;

    // Construtor
    public MyClass(int number, String text) {
        this.number = number;
        this.text = text;
    }

    // Método
    public void display() {
        System.out.println("Number: " + number + ", Text: " + text);
    }
}
```
- Métodos
```java
// Métodos definem o comportamento de uma classe. Eles podem receber parâmetros e retornar valores.
public int add(int a, int b) {
    return a + b;
}
```

- Controle de Fluxo
```java
// Java possui várias estruturas para controle de fluxo, incluindo condicionais e laços.

if (count > 5) {
    System.out.println("Count is greater than 5");
} else if (count == 5) {
    System.out.println("Count is 5");
} else {
    System.out.println("Count is less than 5");
}
```
- Switch
```java
int day = 2;
switch (day) {
    case 1:
        System.out.println("Monday");
        break;
    case 2:
        System.out.println("Tuesday");
        break;
    default:
        System.out.println("Other day");
}

```
- Laços
```java
// for
for (int i = 0; i < 5; i++) {
    System.out.println("i: " + i);
}

// While
int i = 0;
while (i < 5) {
    System.out.println("i: " + i);
    i++;
}

// Do-While
int i = 0;
do {
    System.out.println("i: " + i);
    i++;
} while (i < 5);

```
- Arrays
```java
// Arrays são estruturas de dados que armazenam múltiplos valores do mesmo tipo.
int[] numbers = {1, 2, 3, 4, 5};
for (int number : numbers) {
    System.out.println(number);
}

```
- Classes e Objetos
```java
// Declaração de Classes
public class Car {
    // Variáveis de instância
    String color;
    String model;

    // Construtor
    public Car(String color, String model) {
        this.color = color;
        this.model = model;
    }

    // Métodos
    public void displayDetails() {
        System.out.println("Color: " + color + ", Model: " + model);
    }
}

```
- Instanciação de Objetos
```java
public class Main {
    public static void main(String[] args) {
        Car myCar = new Car("Red", "Toyota");
        myCar.displayDetails();
    }
}

```
- Herança
```java
// Herança permite que uma classe derive de outra classe.
public class Animal {
    public void makeSound() {
        System.out.println("Animal makes a sound");
    }
}

public class Dog extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Dog barks");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog myDog = new Dog();
        myDog.makeSound();
    }
}
```
- Interfaces
```java
// Interfaces definem métodos que uma classe deve implementar.
public interface Animal {
    void makeSound();
}

public class Dog implements Animal {
    @Override
    public void makeSound() {
        System.out.println("Dog barks");
    }
}
```
- Exceções
```java
// Tratamento de exceções permite que o programa lide com erros de forma controlada.
try {
    int result = 10 / 0;
} catch (ArithmeticException e) {
    System.out.println("Cannot divide by zero");
} finally {
    System.out.println("This block always executes");
}
```
- Pacotes
```java
// Pacotes organizam classes relacionadas.
package com.example;

public class MyClass {
    // ...
}
```
- Para importar e usar classes de um pacote:
```java
import com.example.MyClass;

public class Main {
    public static void main(String[] args) {
        MyClass obj = new MyClass();
        // ...
    }
}
```

#### Modificadores de Acesso
Modificadores de acesso controlam a visibilidade de classes, métodos e variáveis.

- `public`: Acessível de qualquer lugar.
- `protected`: Acessível dentro do mesmo pacote e subclasses.
- `default`: (sem modificador): Acessível apenas dentro do mesmo pacote.
- `private`: Acessível apenas dentro da própria classe.


#### Programação Orientada a Objetos
- Classes
- Construtores
- Objetos
- Modificadores de acesso
- Herança
- Polimorfismo

#### Conceitos avançados no Java
>1. Programação Concorrente Threads e Runnable

- **Criação e gerenciamento de threads.
Executors**: Abstração de pools de threads para gerenciar a execução de tarefas.

- **Future e CompletableFuture**: Execução assíncrona e manipulação de resultados futuros.

- **Parallel Streams**: Processamento paralelo de coleções de dados.
ForkJoinPool: Framework para dividir tarefas recursivas em subtarefas menores.


>2. Programação Funcional Lambdas e Expressões Lambda

Sintaxe concisa para expressar implementações de interfaces funcionais.

- **Stream API**: Operações de pipeline para processamento de coleções.

- **Optional**: Representação de valores opcionais que podem estar presentes ou não.

- **Interfaces Funcionais**: Interfaces com um único método abstrato (e.g., Predicate, Function, Supplier, Consumer).

>3. Generics

- **Parâmetros Genéricos**: Definição de classes, interfaces e métodos com tipos genéricos.

- **Wildcards: Uso de curingas** (? extends T, ? super T) para flexibilidade de tipos.

>4. Reflection e Metaprogramação Reflection API

**Inspeção e manipulação de classes, interfaces, campos e métodos em tempo de execução.
Annotations**: Metadados que podem ser usados para influenciar o comportamento do código.

**Annotation Processing**: Processamento de anotações em tempo de compilação para gerar código automaticamente.

>5. Java Memory Model (JMM)

**Visibilidade e Reordenação de Variáveis**: Garantias sobre como as variáveis são visíveis entre threads.
**Volatile**: Modificador que garante a visibilidade das alterações feitas por uma thread a outras threads.
Locks e Synchronized: Sincronização de blocos de código para garantir exclusão mútua.

>6. Java Platform Module System (JPMS)

**Modularização**: Organização do código em módulos com dependências explícitas.

**Module Descriptor**: Arquivo module-info.java que define os módulos e suas dependências.

>7. Streams e IO Avançado

**NIO (New Input/Output)**: Pacote java.nio para operações de I/O não bloqueantes.

**Buffers, Channels e Selectors**: Manipulação eficiente de dados de I/O.

**File API Avançada**: Manipulação de arquivos e diretórios com a classe `Files` e o pacote `java.nio.file`.

>8. JVM Tuning e Garbage Collection

**Parâmetros de Inicialização da JVM**: Configuração de opções de desempenho e gerenciamento de memória.

**Garbage Collectors Avançados**: GC1, ZGC, Shenandoah e suas configurações específicas.
Profiling e Monitoring: Ferramentas para monitorar e analisar o desempenho da JVM (e.g., JFR, VisualVM).

>9. Aspect-Oriented Programming (AOP)

**Cross-Cutting Concerns**: Separação de funcionalidades transversais, como logging e segurança.

**Frameworks de AOP**: Uso de frameworks como AspectJ e Spring AOP para implementar AOP.

>10. Design Patterns e Arquitetura

**Padrões de Projeto**: Singleton, Factory, Builder, Adapter, Decorator, Strategy, etc.

**Arquitetura Limpa e DDD (Domain-Driven Design)**: Práticas para a organização de código em grandes sistemas.

**Microservices e Spring Boot**: Construção de microsserviços com o Spring Boot e padrões de design relacionados.

>11. Bibliotecas e Frameworks Avançados

**Spring Framework**: Injeção de dependências, AOP, transações, etc.

**Hibernate e JPA**: Mapeamento objeto-relacional (ORM) e gerenciamento de persistência.

**Reactive Programming**: Programação reativa com Project Reactor e RxJava.

**Akka**: Modelo de atores para concorrência e distribuição.

Esses conceitos avançados permitem que os desenvolvedores Java criem sistemas robustos, eficientes e escaláveis, aproveitando ao máximo as capacidades da linguagem e da plataforma Java.

#### Utilização de Frameworks
1. **Spring Framework**
   - **Spring Core**: Oferece injeção de dependências e inversão de controle (IoC).
   - **Spring MVC**: Para desenvolvimento de aplicações web.
   - **Spring Boot**: Facilita a criação de aplicativos Spring, reduzindo a necessidade de configuração manual.
   - **Spring Data**: Simplifica o acesso a bancos de dados, com suporte para JPA, MongoDB, Redis, entre outros.
   - **Spring Security**: Fornece autenticação e controle de acesso robustos.
   - **Spring Cloud**: Ferramentas para desenvolvimento de sistemas distribuídos e microservices.

2. Hibernate
Hibernate ORM: Mapeamento objeto-relacional (ORM) que facilita a persistência de dados em bancos de dados relacionais.
Hibernate Validator: Implementação do Bean Validation.
Hibernate Search: Integração com Apache Lucene para facilitar buscas textuais.

3. Apache Struts
Struts 2: Framework para desenvolvimento de aplicações web baseadas em MVC, que facilita o desenvolvimento e a manutenção de aplicativos.

4. JavaServer Faces (JSF)
JSF: Framework para construção de interfaces de usuário baseadas em componentes para aplicações web Java.

5. Apache Wicket
Wicket: Framework de desenvolvimento web que permite construir aplicações usando componentes Java puras, mantendo o HTML e Java separados.

6. Dropwizard
Dropwizard: Framework para desenvolvimento rápido de serviços RESTful, combinando várias bibliotecas de produção (Jetty, Jackson, Jersey, Metrics, etc.).

7. Vaadin
Vaadin: Framework para construção de interfaces de usuário web modernas com Java, permitindo criar UI sem necessidade de escrever JavaScript ou HTML.

8. Play Framework
Play: Framework para desenvolvimento de aplicações web e APIs com foco em escalabilidade e produtividade, usando um modelo de programação reativa.

9. Grails
Grails: Framework para construção rápida de aplicações web, baseado no Groovy e fortemente integrado com Spring Boot.

10. Quarkus
Quarkus: Framework para construção de aplicações Java nativas na nuvem, com foco em tempo de inicialização rápido e baixo consumo de memória.

11. Apache Spark
Spark: Framework para processamento de grandes volumes de dados em tempo real, amplamente utilizado em análises de Big Data.

12. Micronaut
Micronaut: Framework para construção de microservices e aplicações serverless, com foco em inicialização rápida e baixo consumo de memória.

13. Vert.x
Vert.x: Toolkit para construção de aplicações reativas, com suporte para várias linguagens de programação, incluindo Java.

14. JUnit
JUnit: Framework de testes unitários para Java, amplamente utilizado para escrever e rodar testes automatizados.

15. Mockito
Mockito: Framework para criação de objetos mock em testes unitários, permitindo simular comportamentos e verificar interações.

16. Log4j / SLF4J
- Log4j: Framework para logging, que permite registrar informações sobre o comportamento da aplicação.
- SLF4J: Interface de abstração de logging que permite trocar a implementação de logging sem

alterar o código da aplicação.
17. Apache Camel
Camel: Framework para integração e roteamento de mensagens, oferecendo uma implementação de padrões de integração empresarial (EIP).

#### Perguntas basicas

Qual a diferença de interface para classe abstrata ?

Quais conceitos do SOLID você utiliza mais ?

Qual a diferença de override para overload ?
- **Override (Sobrescrita)**
   - Mesma assinatura que na superclasse.
   - Usado em herança.
   - Implementação específica na subclasse.

- **Overload (Sobrecarga)**
   - Mesmo nome do método, mas parâmetros diferentes.
   - Pode ocorrer na mesma classe ou em subclasses.
   - Permite diferentes formas de usar o mesmo método dependendo dos parâmetros.


Como você usa um ORM ?

Quais os princioos rest API que você utiliza ?
