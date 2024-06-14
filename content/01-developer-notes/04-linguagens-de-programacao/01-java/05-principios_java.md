---
title: "Principios do Java"
weight: 3
---

### Conceitos e Evoluções do Java

#### Conceitos Básicos

Os conceitos fundamentais da linguagem Java permanecem consistentes, mesmo com as muitas mudanças significativas ao longo dos anos que melhoraram seu desempenho em larga escala. A programação concorrente e o controle de fluxos futuros são exemplos de áreas que evoluíram. No entanto, os conceitos principais e básicos da linguagem, como orientação a objetos, encapsulamento, herança e polimorfismo, nunca mudam, apenas passam por evoluções.

Baseando-me em leituras de livros e vídeos do YouTube, alimento essas anotações com conhecimentos e experiências práticas do dia a dia. Gosto de realizar novos testes com diferentes abordagens e documentar os resultados aqui. Por exemplo, gerar downtime em muitos deploys é uma prática comum que pode ser aprimorada com novas técnicas.

#### JVM e Performance

A Java Virtual Machine (JVM) utiliza os recursos da máquina física para funcionar, o que levou ao jargão entre programadores de que o Java é lento. Isso se deve à sobrecarga de tradução de bytecode Java para linguagem de máquina nativa, realizada "por baixo dos panos". Contudo, as melhorias contínuas na JVM têm reduzido significativamente essas limitações.

#### JTB e a Evolução para Spring Boot

##### JTB: Uma Plataforma Verbosa

JTB era uma plataforma conhecida por sua verbosidade e complexidade na inicialização e testabilidade. Todas as dependências eram acopladas, incluindo o banco de dados, o sistema de mensageria e as chamadas remotas, dificultando a manutenção e a escalabilidade.

##### Tomcat

O Tomcat era um servidor onde várias aplicações eram hospedadas. Os arquivos .war eram implantados e o servidor ficava fazendo polling até que o novo processo fosse iniciado.

##### Spring Boot

O Spring Boot trouxe uma mudança significativa ao permitir que cada aplicação fosse executada em um contêiner de servidor de aplicação próprio, geralmente um .jar. Isso significa que cada aplicação roda em seu próprio contêiner de servidor, como Tomcat ou Undertow, embutido, simplificando a implantação e melhorando a isolação entre aplicações.

##### Tempo de Inicialização

Criar uma aplicação em Java envolve subir um servidor de aplicação embutido, inicializar a JVM e, em seguida, iniciar a aplicação. Esse processo pode levar de 30 a 40 segundos.

##### Configuração Programática

Anteriormente, a configuração das aplicações Java era feita em XML. Atualmente, com o Spring Boot, as configurações passaram a ser programáticas e baseadas em Java. O Spring Boot encapsula essas configurações em arquivos `application.yml` ou `application.properties`, simplificando a configuração e a manutenção das aplicações.

### GraalVM

GraalVM é uma máquina virtual poliglota de alto desempenho desenvolvida pela Oracle. Seu objetivo é proporcionar um ambiente de execução unificado para diversas linguagens de programação, como Java, JavaScript, Python, Ruby, R, e também suportar linguagens como LLVM e WebAssembly. GraalVM melhora o desempenho de aplicativos e simplifica o desenvolvimento poliglota, permitindo que diferentes linguagens interajam entre si com baixo overhead.

### Artefatos Finais

Os artefatos finais das aplicações Java são geralmente arquivos .war ou .jar. O formato .jar tornou-se um padrão para empacotar aplicações Java, especialmente com o advento do Spring Boot, que encapsula tudo em um único arquivo executável .jar, facilitando a implantação e execução de aplicações Java.

### Webflux
Cada thread responde a uma unica requisição por usuario.

A thread inicia com 2 a 3 megas, pra você iniciar a stack em cima dela.

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
1. if
int a = 10;
if (a > 5) {
    System.out.println("a é maior que 5");
}

2. if-else
int a = 3;
if (a > 5) {
    System.out.println("a é maior que 5");
} else {
    System.out.println("a não é maior que 5");
}

3. if-else if-else
int a = 10;
if (a > 10) {
    System.out.println("a é maior que 10");
} else if (a == 10) {
    System.out.println("a é igual a 10");
} else {
    System.out.println("a é menor que 10");
}

4. switch
int day = 2;
switch (day) {
    case 1:
        System.out.println("Segunda-feira");
        break;
    case 2:
        System.out.println("Terça-feira");
        break;
    case 3:
        System.out.println("Quarta-feira");
        break;
    case 4:
        System.out.println("Quinta-feira");
        break;
    case 5:
        System.out.println("Sexta-feira");
        break;
    case 6:
        System.out.println("Sábado");
        break;
    case 7:
        System.out.println("Domingo");
        break;
    default:
        System.out.println("Dia inválido");
        break;
}

5. switch com Strings
String fruit = "Apple";
switch (fruit) {
    case "Apple":
        System.out.println("It's an apple");
        break;
    case "Banana":
        System.out.println("It's a banana");
        break;
    case "Orange":
        System.out.println("It's an orange");
        break;
    default:
        System.out.println("Unknown fruit");
        break;
}

```
- Vetor
```java
1. Declaração de Arrays

- Declaração de um array de inteiros

int[] numbers;

- Declaração de um array de strings
String[] names;

2. Inicialização de Arrays
- Inicialização de um array de inteiros com tamanho 5

numbers = new int[5];

- Inicialização de um array de strings com tamanho 3

names = new String[3];

- Você também pode declarar e inicializar um array simultaneamente:
Declaração e inicialização simultânea de um array de inteiros

int[] numbers = new int[5];

- Declaração e inicialização simultânea de um array de strings

String[] names = new String[3];

3. Inicialização com Valores
- Inicialização de um array de inteiros com valores

int[] numbers = {1, 2, 3, 4, 5};

- Inicialização de um array de strings com valores

String[] names = {"Alice", "Bob", "Charlie"};

- Acessando Elementos de um Array
Os elementos de um array são acessados usando índices, que começam em 0.
Acessando o primeiro elemento do array

int firstNumber = numbers[0];

- Acessando o terceiro elemento do array

String thirdName = names[2];

- Modificando Elementos de um Array
Você pode alterar o valor de um elemento em um array usando seu índice.
Modificando o valor do primeiro elemento

numbers[0] = 10;

- Modificando o valor do terceiro elemento

names[2] = "Dave";

- Iterando sobre Arrays
Você pode usar um laço for ou um laço for-each para iterar sobre os elementos de um array. Usando o laço for

- for (int i = 0; i < numbers.length; i++) {
    System.out.println(numbers[i]);
}

- Usando o laço for-each

for (int number : numbers) {
    System.out.println(number);
}

- Arrays Multidimensionais
Java também suporta arrays multidimensionais, que são arrays de arrays. O mais comum é o array bidimensional, que pode ser visualizado como uma matriz.

- Declaração e Inicialização de um Array Bidimensional
Declaração de um array bidimensional

int[][] matrix;

- Inicialização de um array bidimensional

matrix = new int[3][3];

- Você pode declarar e inicializar um array bidimensional simultaneamente:

int[][] matrix = new int[3][3];

- Inicialização com Valores

int[][] matrix = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};

- Acessando Elementos de um Array Bidimensional
  Acessando o elemento na primeira linha e segunda coluna

int value = matrix[0][1];

- Iterando sobre um Array Bidimensional
Você pode usar laços aninhados para iterar sobre os elementos de um array bidimensional.

for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
        System.out.print(matrix[i][j] + " ");
    }
    System.out.println();
}
```
- ArrayList
```java
- Declaração e Inicialização
Você pode declarar e inicializar um ArrayList da seguinte forma:

ArrayList<Integer> numbers = new ArrayList<>();
ArrayList<String> names = new ArrayList<>();

- Adicionando Elementos
Para adicionar elementos ao ArrayList, você usa o método add:

numbers.add(1);
numbers.add(2);
numbers.add(3);

names.add("Alice");
names.add("Bob");
names.add("Charlie");

- Acessando Elementos
Você pode acessar os elementos do ArrayList usando o método get e o índice do elemento:

int firstNumber = numbers.get(0); // Acessa o primeiro elemento
String firstName = names.get(0);  // Acessa o primeiro elemento

- Modificando Elementos
Para modificar um elemento existente, use o método set:

numbers.set(0, 10); // Modifica o primeiro elemento para 10
names.set(1, "David"); // Modifica o segundo elemento para "David"

- Removendo Elementos
Você pode remover elementos usando o índice ou o próprio objeto:

numbers.remove(1); // Remove o segundo elemento (índice 1)
names.remove("Charlie"); // Remove o elemento "Charlie"

- Verificando o Tamanho
Para obter o número de elementos no ArrayList, use o método size:

int size = numbers.size();

- Iterando sobre Elementos
Você pode iterar sobre os elementos de um ArrayList usando um laço for tradicional, um laço for-each, ou um iterador:

Usando um Laço for Tradicional

for (int i = 0; i < numbers.size(); i++) {
    System.out.println(numbers.get(i));
}

- Usando um Laço for-each

for (int number : numbers) {
    System.out.println(number);
}

- Usando um Iterador

import java.util.Iterator;

Iterator<String> iterator = names.iterator();
while (iterator.hasNext()) {
    System.out.println(iterator.next());
}

- Verificando a Existência de um Elemento
Para verificar se um ArrayList contém um elemento específico, use o método contains:

boolean hasAlice = names.contains("Alice");

- Convertendo um Array para um ArrayList
Você pode converter um array para um ArrayList usando o método Arrays.asList

import java.util.Arrays;

String[] array = {"Tom", "Jerry"};
ArrayList<String> list = new ArrayList<>(Arrays.asList(array));

- Convertendo um ArrayList para um Array
Você pode converter um ArrayList para um array usando o método toArray:

String[] array = new String[names.size()];
array = names.toArray(array);

- Exemplo Completo
Aqui está um exemplo completo que demonstra a criação, manipulação e iteração de um ArrayList:

import java.util.ArrayList;

public class ArrayListExample {
    public static void main(String[] args) {
        // Criação de um ArrayList
        ArrayList<Integer> numbers = new ArrayList<>();

        // Adicionando elementos
        numbers.add(1);
        numbers.add(2);
        numbers.add(3);
        System.out.println("Numbers: " + numbers);

        // Acessando elementos
        int firstNumber = numbers.get(0);
        System.out.println("First number: " + firstNumber);

        // Modificando elementos
        numbers.set(0, 10);
        System.out.println("Modified numbers: " + numbers);

        // Removendo elementos
        numbers.remove(1);
        System.out.println("After removal: " + numbers);

        // Verificando o tamanho
        int size = numbers.size();
        System.out.println("Size: " + size);

        // Iterando sobre os elementos
        for (int number : numbers) {
            System.out.println(number);
        }
    }
}

```
- Loops
```java
- 1. for Loop

for (inicialização; condição; atualização) {
    // bloco de código a ser executado
}

- Exemplo
for (int i = 0; i < 5; i++) {
    System.out.println("i: " + i);
}

Neste exemplo:

int i = 0 é a inicialização.
i < 5 é a condição.
i++ é a atualização.

- 2. while Loop

Estrutura do while Loop

while (condição) {
    // bloco de código a ser executado
}

Exemplo

int i = 0;
while (i < 5) {
    System.out.println("i: " + i);
    i++;
}

Neste exemplo, a condição i < 5 é verificada antes de cada iteração do loop.

- 3. do-while Loop
Estrutura do do-while Loop

do {
    // bloco de código a ser executado
} while (condição);

Exemplo

int i = 0;
do {
    System.out.println("i: " + i);
    i++;
} while (i < 5);

Neste exemplo, o bloco de código dentro do do é executado antes de verificar a condição i < 5.

- 4. for-each Loop

Estrutura do for-each Loop

for (tipo elemento : coleção) {
    // bloco de código a ser executado
}

Exemplo

int[] numbers = {1, 2, 3, 4, 5};
for (int number : numbers) {
    System.out.println("number: " + number);
}

Controle de Loop: break e continue
break
A instrução break é usada para sair do loop imediatamente.

for (int i = 0; i < 10; i++) {
    if (i == 5) {
        break;
    }
    System.out.println("i: " + i);
}

Neste exemplo, o loop é interrompido quando i é igual a 5.

continue
A instrução continue é usada para pular a iteração atual e continuar com a próxima iteração do loop.

for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) {
        continue;
    }
    System.out.println("i: " + i);
}

Neste exemplo, o loop pula as iterações quando i é um número par.

Exemplo Completo
Aqui está um exemplo completo que demonstra o uso de vários tipos de loops em Java:

public class LoopExample {
    public static void main(String[] args) {
        // for loop
        for (int i = 0; i < 5; i++) {
            System.out.println("for loop i: " + i);
        }

        // while loop
        int j = 0;
        while (j < 5) {
            System.out.println("while loop j: " + j);
            j++;
        }

        // do-while loop
        int k = 0;
        do {
            System.out.println("do-while loop k: " + k);
            k++;
        } while (k < 5);

        // for-each loop
        int[] numbers = {1, 2, 3, 4, 5};
        for (int number : numbers) {
            System.out.println("for-each loop number: " + number);
        }
    }
}
```
- Castings
```java
- 1. Casting Implícito (Automático)
O casting implícito ocorre quando o compilador Java converte automaticamente um tipo de dados menor para um tipo de dados maior. Isso é seguro porque não há perda de dados.

Exemplo
int num = 10;
double doubleNum = num; // Conversão implícita de int para double
System.out.println(doubleNum); // Saída: 10.0

Neste exemplo, o int num é convertido automaticamente para double doubleNum sem necessidade de um casting explícito.

- 2. Casting Explícito (Manual)
O casting explícito é necessário quando você deseja converter um tipo de dados maior para um tipo de dados menor. Isso pode levar à perda de dados, por isso precisa ser feito manualmente com o operador de casting.

Exemplo

double doubleNum = 10.5;
int num = (int) doubleNum; // Conversão explícita de double para int
System.out.println(num); // Saída: 10

Neste exemplo, o double doubleNum é explicitamente convertido para int num, e a parte fracionária é perdida.

- Casting entre Tipos de Dados Primitivos

Exemplo de Conversão Implícita

int num = 100;
long longNum = num; // int para long
float floatNum = longNum; // long para float
System.out.println(floatNum); // Saída: 100.0

Exemplo de Conversão Explícita

double doubleNum = 100.04;
long longNum = (long) doubleNum; // double para long
int num = (int) longNum; // long para int
System.out.println(num); // Saída: 100

- Casting entre Objetos

Java permite o casting entre tipos de objetos dentro da hierarquia de classes. O casting pode ser feito de duas maneiras principais:

1. Upcasting: Converter um objeto de uma subclasse para uma superclasse. Upcasting é feito implicitamente.
2. Downcasting: Converter um objeto de uma superclasse para uma subclasse. Downcasting deve ser feito explicitamente e pode lançar uma ClassCastException se não for feito corretamente.

Exemplo de Upcasting

class Animal {
    void makeSound() {
        System.out.println("Animal makes a sound");
    }
}

class Dog extends Animal {
    void bark() {
        System.out.println("Dog barks");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog dog = new Dog();
        Animal animal = dog; // Upcasting, implícito
        animal.makeSound(); // Saída: Animal makes a sound
    }
}

Exemplo de Downcasting

public class Main {
    public static void main(String[] args) {
        Animal animal = new Dog(); // Upcasting, implícito
        Dog dog = (Dog) animal; // Downcasting, explícito
        dog.bark(); // Saída: Dog barks
    }
}

- Verificação de Tipos com instanceof
Antes de fazer um downcasting, é uma boa prática usar o operador instanceof para evitar ClassCastException.

if (animal instanceof Dog) {
    Dog dog = (Dog) animal;
    dog.bark();
}

- Conversão entre Tipos de Referência e Tipos Primitivos
Java fornece classes wrapper para cada tipo de dados primitivo, permitindo conversões entre tipos de referência (objetos) e tipos primitivos.

Autoboxing e Unboxing
Autoboxing é a conversão automática de tipos primitivos para seus correspondentes tipos de referência, e unboxing é a conversão inversa.

// Autoboxing
int num = 10;
Integer numObj = num; // int para Integer

// Unboxing
Integer numObj2 = new Integer(20);
int num2 = numObj2; // Integer para int

Exemplo Completo

public class CastingExample {
    public static void main(String[] args) {
        // Casting entre tipos primitivos
        int num = 100;
        long longNum = num; // Implícito
        float floatNum = longNum; // Implícito

        double doubleNum = 100.04;
        long longNum2 = (long) doubleNum; // Explícito
        int num2 = (int) longNum2; // Explícito

        System.out.println("floatNum: " + floatNum); // Saída: 100.0
        System.out.println("num2: " + num2); // Saída: 100

        // Casting entre objetos
        Animal animal = new Dog(); // Upcasting, implícito
        if (animal instanceof Dog) {
            Dog dog = (Dog) animal; // Downcasting, explícito
            dog.bark(); // Saída: Dog barks
        }

        // Autoboxing e unboxing
        Integer numObj = num; // Autoboxing
        int num3 = numObj; // Unboxing

        System.out.println("num3: " + num3); // Saída: 100
    }
}

class Animal {
    void makeSound() {
        System.out.println("Animal makes a sound");
    }
}

class Dog extends Animal {
    void bark() {
        System.out.println("Dog barks");
    }
}

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
```java
public class Car {
    // Atributos
    String color;
    String model;
    int year;

    // Método
    void drive() {
        System.out.println("The car is driving");
    }
}
```
- Construtores
```java
// Construtor padrão (default constructor)
// Construtor parametrizado (parameterized constructor)

Exemplo de Construtor Padrão
public class Car {
    String model;
    String color;
    int year;

    // Construtor padrão
    public Car() {
        this.model = "Unknown";
        this.color = "White";
        this.year = 2000;
    }

    void display() {
        System.out.println("Model: " + model);
        System.out.println("Color: " + color);
        System.out.println("Year: " + year);
    }
}

public class Main {
    public static void main(String[] args) {
        Car myCar = new Car(); // Chamando o construtor padrão
        myCar.display();
    }
}

Construtor Parametrizado
// O construtor parametrizado permite que você inicialize os atributos do objeto com valores específicos fornecidos na hora da criação do objeto.

Exemplo de Construtor Parametrizado

public class Car {
    String model;
    String color;
    int year;

    // Construtor parametrizado
    public Car(String model, String color, int year) {
        this.model = model;
        this.color = color;
        this.year = year;
    }

    void display() {
        System.out.println("Model: " + model);
        System.out.println("Color: " + color);
        System.out.println("Year: " + year);
    }
}

public class Main {
    public static void main(String[] args) {
        Car myCar = new Car("Toyota", "Red", 2021); // Chamando o construtor parametrizado
        myCar.display();
    }
}

Sobrecarga de Construtores
Assim como métodos, construtores podem ser sobrecarregados para permitir diferentes maneiras de criar objetos com diferentes conjuntos de parâmetros.

Exemplo de Sobrecarga de Construtores

public class Car {
    String model;
    String color;
    int year;

    // Construtor padrão
    public Car() {
        this.model = "Unknown";
        this.color = "White";
        this.year = 2000;
    }

    // Construtor parametrizado
    public Car(String model, String color, int year) {
        this.model = model;
        this.color = color;
        this.year = year;
    }

    void display() {
        System.out.println("Model: " + model);
        System.out.println("Color: " + color);
        System.out.println("Year: " + year);
    }
}

public class Main {
    public static void main(String[] args) {
        Car defaultCar = new Car(); // Chamando o construtor padrão
        Car customCar = new Car("Toyota", "Red", 2021); // Chamando o construtor parametrizado

        defaultCar.display();
        customCar.display();
    }
}

Construtores e Herança
Quando se trabalha com herança, os construtores da superclasse podem ser chamados na subclasse usando a palavra-chave super.

Exemplo de Construtores com Herança

class Vehicle {
    String brand;

    // Construtor da superclasse
    public Vehicle(String brand) {
        this.brand = brand;
    }
}

class Car extends Vehicle {
    String model;

    // Construtor da subclasse
    public Car(String brand, String model) {
        super(brand); // Chamando o construtor da superclasse
        this.model = model;
    }

    void display() {
        System.out.println("Brand: " + brand);
        System.out.println("Model: " + model);
    }
}

public class Main {
    public static void main(String[] args) {
        Car myCar = new Car("Toyota", "Corolla"); // Chamando o construtor da subclasse
        myCar.display();
    }
}

Construtores e this
A palavra-chave this pode ser usada dentro de um construtor para chamar outro construtor da mesma classe. Isso é útil para evitar duplicação de código.

Exemplo de this com Construtores

public class Car {
    String model;
    String color;
    int year;

    // Construtor padrão
    public Car() {
        this("Unknown", "White", 2000);
    }

    // Construtor parametrizado
    public Car(String model, String color, int year) {
        this.model = model;
        this.color = color;
        this.year = year;
    }

    void display() {
        System.out.println("Model: " + model);
        System.out.println("Color: " + color);
        System.out.println("Year: " + year);
    }
}

public class Main {
    public static void main(String[] args) {
        Car defaultCar = new Car(); // Chamando o construtor padrão
        Car customCar = new Car("Toyota", "Red", 2021); // Chamando o construtor parametrizado

        defaultCar.display();
        customCar.display();
    }
}
```
- Objetos
```java
public class Main {
    public static void main(String[] args) {
        // Criação de um objeto da classe Car
        Car myCar = new Car();
        myCar.color = "Red";
        myCar.model = "Toyota";
        myCar.year = 2021;

        // Chamando um método no objeto
        myCar.drive(); // Saída: The car is driving
    }
}
```
- Herança
```java
// Superclasse
public class Animal {
    void makeSound() {
        System.out.println("Animal makes a sound");
    }
}

// Subclasse
public class Dog extends Animal {
    void bark() {
        System.out.println("Dog barks");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog dog = new Dog();
        dog.makeSound(); // Método herdado da classe Animal
        dog.bark(); // Método da classe Dog
    }
}
```
- Polimorfismo
```java
// Sobrecarga de Métodos (Overloading) Permite que vários métodos tenham o mesmo nome, mas com diferentes assinaturas.
public class MathUtils {
    // Método sobrecarregado
    public int add(int a, int b) {
        return a + b;
    }

    // Método sobrecarregado
    public double add(double a, double b) {
        return a + b;
    }
}

public class Main {
    public static void main(String[] args) {
        MathUtils math = new MathUtils();
        System.out.println(math.add(5, 3)); // Saída: 8
        System.out.println(math.add(5.5, 3.3)); // Saída: 8.8
    }
}

// Sobrescrita de Métodos (Overriding) Permite que uma subclasse forneça uma implementação específica de um método que já está definido em sua superclasse.
public class Animal {
    void makeSound() {
        System.out.println("Animal makes a sound");
    }
}

public class Dog extends Animal {
    @Override
    void makeSound() {
        System.out.println("Dog barks");
    }
}

public class Main {
    public static void main(String[] args) {
        Animal myAnimal = new Dog();
        myAnimal.makeSound(); // Saída: Dog barks
    }
}
```
- Encapsulamento
```java
public class Person {
    // Atributo privado
    private String name;

    // Método getter
    public String getName() {
        return name;
    }

    // Método setter
    public void setName(String name) {
        this.name = name;
    }
}

public class Main {
    public static void main(String[] args) {
        Person person = new Person();
        person.setName("John");
        System.out.println(person.getName()); // Saída: John
    }
}
```
- Abstração
```java
// Classes Abstratas
// Uma classe abstrata não pode ser instanciada e pode conter métodos abstratos (sem corpo) que devem ser implementados por subclasses.
public abstract class Shape {
    abstract void draw();
}

public class Circle extends Shape {
    @Override
    void draw() {
        System.out.println("Drawing a circle");
    }
}

public class Main {
    public static void main(String[] args) {
        Shape shape = new Circle();
        shape.draw(); // Saída: Drawing a circle
    }
}

// Interfaces
// Uma interface é um contrato que define métodos que uma classe deve implementar.

public interface Animal {
    void eat();
}

public class Dog implements Animal {
    @Override
    public void eat() {
        System.out.println("Dog eats");
    }
}

public class Main {
    public static void main(String[] args) {
        Animal myDog = new Dog();
        myDog.eat(); // Saída: Dog eats
    }
}

Exemplo Completo
Aqui está um exemplo que incorpora todos esses conceitos:

// Classe abstrata
abstract class Animal {
    abstract void makeSound();
}

// Subclasse de Animal
class Dog extends Animal {
    @Override
    void makeSound() {
        System.out.println("Dog barks");
    }
}

// Classe com encapsulamento
class Person {
    private String name;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}

// Classe com métodos sobrecarregados
class MathUtils {
    public int add(int a, int b) {
        return a + b;
    }
    public double add(double a, double b) {
        return a + b;
    }
}

public class Main {
    public static void main(String[] args) {
        // Polimorfismo e Herança
        Animal myAnimal = new Dog();
        myAnimal.makeSound(); // Saída: Dog barks

        // Encapsulamento
        Person person = new Person();
        person.setName("John");
        System.out.println(person.getName()); // Saída: John

        // Sobrecarga de métodos
        MathUtils math = new MathUtils();
        System.out.println(math.add(5, 3)); // Saída: 8
        System.out.println(math.add(5.5, 3.3)); // Saída: 8.8
    }
}
```


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

2. **Hibernate**
Hibernate ORM: Mapeamento objeto-relacional (ORM) que facilita a persistência de dados em bancos de dados relacionais.
Hibernate Validator: Implementação do Bean Validation.
Hibernate Search: Integração com Apache Lucene para facilitar buscas textuais.

3. **Apache Struts Struts 2**: Framework para desenvolvimento de aplicações web baseadas em MVC, que facilita o desenvolvimento e a manutenção de aplicativos.

4. **JavaServer Faces (JSF) JSF**: Framework para construção de interfaces de usuário baseadas em componentes para aplicações web Java.

5. **Apache Wicket**: Framework de desenvolvimento web que permite construir aplicações usando componentes Java puras, mantendo o HTML e Java separados.

6. **Dropwizard**: Framework para desenvolvimento rápido de serviços RESTful, combinando várias bibliotecas de produção (Jetty, Jackson, Jersey, Metrics, etc.).

7. **Vaadin**: Framework para construção de interfaces de usuário web modernas com Java, permitindo criar UI sem necessidade de escrever JavaScript ou HTML.

8. **Play Framework Play**: Framework para desenvolvimento de aplicações web e APIs com foco em escalabilidade e produtividade, usando um modelo de programação reativa.

9. **Grails**: Framework para construção rápida de aplicações web, baseado no Groovy e fortemente integrado com Spring Boot.

10. **Quarkus**: Framework para construção de aplicações Java nativas na nuvem, com foco em tempo de inicialização rápido e baixo consumo de memória.

11. **Apache Spark**: Framework para processamento de grandes volumes de dados em tempo real, amplamente utilizado em análises de Big Data.

12. **Micronaut**: Framework para construção de microservices e aplicações serverless, com foco em inicialização rápida e baixo consumo de memória.

13. **Vert.x**: Toolkit para construção de aplicações reativas, com suporte para várias linguagens de programação, incluindo Java.

14. **JUnit**: Framework de testes unitários para Java, amplamente utilizado para escrever e rodar testes automatizados.

15. **Mockito**: Framework para criação de objetos mock em testes unitários, permitindo simular comportamentos e verificar interações.

16. **Log4j / SLF4J**: Framework para logging, que permite registrar informações sobre o comportamento da aplicação.
    - SLF4J: Interface de abstração de logging que permite trocar a implementação de logging sem alterar o código da aplicação.
17. **Apache Camel**: Framework para integração e roteamento de mensagens, oferecendo uma implementação de padrões de integração empresarial (EIP).

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
