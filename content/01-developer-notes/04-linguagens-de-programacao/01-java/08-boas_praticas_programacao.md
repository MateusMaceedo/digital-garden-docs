---
title: "Boas Práticas de Programação e Qualidade de Código"
weight: 3
---

#### O que é um Código de Qualidade ?

- **Durabilidade**
- **Reaproveitamento**
- **Legível e de fácil manuntenção**

##### Princípios Fundamentais de boas práticas

- **Alta Coesão**
Alta coesão significa garantir que as classes tenham funcções e definições referentes somente a elas.

- **Baixo Acomplamento**
Baixo acoplamento siginifica garantir que as funcionalidades do sistema estejam completamente separadas, não havendo relação entre uma funcionalidade o outra.

#### Como ter um código de qualidade ?

- **SOLID**
- **Design Patterns (Padrões de Projeto)**

##### SOLID

1. **Single Responsibility Principle (SRP) - Princípio da Responsabilidade Única**:

   - **Definição**: Uma classe deve ter apenas uma razão para mudar, ou seja, deve ter uma única responsabilidade.
   - **Benefício**: Facilita a manutenção e evolução do código, pois cada classe tem um único propósito.

   **Exemplo de SRP**:
  ```java
  // Classe violando SRP
  public class User {
      public void login(String username, String password) {
          // lógica de login
      }
      public void save() {
          // lógica de salvar no banco de dados
      }
  }

  // Refatorado para seguir SRP
  public class User {
      // atributos e métodos relacionados ao usuário
  }

  public class UserService {
      public void login(String username, String password) {
          // lógica de login
      }
  }

  public class UserRepository {
      public void save(User user) {
          // lógica de salvar no banco de dados
      }
  }
  ```

2. **Open/Closed Principle (OCP) - Princípio do Aberto/Fechado**:

   - **Definição**: Entidades de software (classes, módulos, funções, etc.) devem estar abertas para extensão, mas fechadas para modificação.
   - **Benefício**: Permite a adição de novas funcionalidades sem alterar o código existente, minimizando o risco de introduzir novos bugs.

   **Exemplo de OCP**:
  ```java
  // Classe violando OCP
  public class PaymentProcessor {
      public void processCreditCard(CreditCard card) {
          // lógica de processamento de cartão de crédito
      }
      public void processPayPal(PayPalAccount account) {
          // lógica de processamento de PayPal
      }
  }

  // Refatorado para seguir OCP
  public interface PaymentMethod {
      void processPayment();
  }

  public class CreditCard implements PaymentMethod {
      @Override
      public void processPayment() {
          // lógica de processamento de cartão de crédito
      }
  }

  public class PayPal implements PaymentMethod {
      @Override
      public void processPayment() {
          // lógica de processamento de PayPal
      }
  }

  public class PaymentProcessor {
      public void processPayment(PaymentMethod method) {
          method.processPayment();
      }
  }
  ```

3. **Liskov Substitution Principle (LSP) - Princípio da Substituição de Liskov**:

   - **Definição**: Subtipos devem ser substituíveis por seus tipos base sem alterar o comportamento correto do programa.
   - **Benefício**: Garante que uma classe derivada possa ser usada no lugar de sua classe base sem problemas, promovendo a reutilização de código.

   **Exemplo de LSP**:
   ```java
   // Violando LSP
   public class Rectangle {
       private int width;
       private int height;
       // getters e setters
   }

   public class Square extends Rectangle {
       // getters e setters que causam problemas de substituição
   }

   // Seguindo LSP
   public interface Shape {
       int getArea();
   }

   public class Rectangle implements Shape {
       private int width;
       private int height;
       @Override
       public int getArea() {
           return width * height;
       }
   }

   public class Square implements Shape {
       private int side;
       @Override
       public int getArea() {
           return side * side;
       }
   }
   ```

4. **Interface Segregation Principle (ISP) - Princípio da Segregação de Interface**:

   - **Definição**: Muitas interfaces específicas são melhores do que uma interface única e abrangente.
   - **Benefício**: Reduz a dependência de classes em métodos que não utilizam, promovendo uma arquitetura mais modular e de fácil manutenção.

   **Exemplo de ISP**:
   ```java
   // Violando ISP
   public interface Worker {
       void work();
       void eat();
   }

   public class Robot implements Worker {
       @Override
       public void work() {
           // implementação
       }
       @Override
       public void eat() {
           // robots não comem
       }
   }

   // Seguindo ISP
   public interface Workable {
       void work();
   }

   public interface Eatable {
       void eat();
   }

   public class Robot implements Workable {
       @Override
       public void work() {
           // implementação
       }
   }

   public class Human implements Workable, Eatable {
       @Override
       public void work() {
           // implementação
       }
       @Override
       public void eat() {
           // implementação
       }
   }
   ```


5. **Dependency Inversion Principle (DIP) - Princípio da Inversão de Dependência**:

   - **Definição**: Dependa de abstrações, não de concretudes. Módulos de alto nível não devem depender de módulos de baixo nível, mas ambos devem depender de abstrações.
   - **Benefício**: Reduz o acoplamento entre módulos, facilitando a evolução e manutenção do sistema.

   **Exemplo de DIP**:
   ```java
   // Violando DIP
   public class Light {
       public void turnOn() {
           // implementação
       }
   }

   public class Switch {
       private Light light;
       public Switch() {
           this.light = new Light();
       }
       public void operate() {
           light.turnOn();
       }
   }

   // Seguindo DIP
   public interface Switchable {
       void turnOn();
   }

   public class Light implements Switchable {
       @Override
       public void turnOn() {
           // implementação
       }
   }

   public class Switch {
       private Switchable device;
       public Switch(Switchable device) {
           this.device = device;
       }
       public void operate() {
           device.turnOn();
       }
   }
   ```

##### Designer Patterns (Padrões de Projeto)

Principais Design Patterns (Padrões de Projeto), classificados nas três categorias: Criacionais, Estruturais e Comportamentais.

##### Tabela de Design Patterns

| **Categoria**       | **Padrão**                  | **Descrição**                                                                                          | **Exemplo de Uso**                                                                                                                                             |
|---------------------|-----------------------------|--------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
|           |          |              ***(Criacionais)***   |
| |**Factory Method**          | Define uma interface para criar um objeto, mas permite às subclasses alterarem o tipo de objeto que será criado. | Criação de objetos de diferentes tipos em uma hierarquia de classes de produtos.                                                                               |
|                     | **Abstract Factory**        | Fornece uma interface para criar famílias de objetos relacionados ou dependentes sem especificar suas classes concretas. | Criação de conjuntos de objetos relacionados, como UI components para diferentes temas (ex.: Windows vs. MacOS).                                              |
|                     | **Singleton**               | Garante que uma classe tenha apenas uma instância e fornece um ponto de acesso global a ela.              | Gestão de recursos compartilhados, como conexões de banco de dados, logging, configuração de aplicações.                                                     |
|                     | **Builder**                 | Separa a construção de um objeto complexo da sua representação, permitindo a criação passo a passo.       | Criação de objetos complexos com muitas partes opcionais ou configurações (ex.: montagem de um documento).                                                    |
|                     | **Prototype**               | Permite a criação de novos objetos a partir de um modelo ou protótipo, clonando-o.                         | Criação de objetos quando a construção direta é custosa, como em jogos ou aplicações gráficas (ex.: clonagem de personagens).                                  |
|    |    | ***(Estruturais)***     |
|    | **Adapter**                 | Permite que interfaces incompatíveis trabalhem juntas, agindo como um conversor.                           | Integração de uma nova biblioteca de terceiros que possui uma interface diferente da esperada pela aplicação.                                                |
|                     | **Bridge**                  | Desacopla uma abstração da sua implementação, permitindo que ambas variem independentemente.              | Desenvolvimento de sistemas que precisam suportar múltiplas plataformas ou dispositivos, como renderização gráfica em diferentes APIs.                       |
|                     | **Composite**               | Compõe objetos em estruturas de árvore para representar hierarquias parte-todo.                           | Representação de hierarquias como diretórios e arquivos em um sistema de arquivos, ou componentes gráficos em uma interface de usuário.                      |
|                     | **Decorator**               | Anexa responsabilidades adicionais a um objeto dinamicamente.                                           | Adição de funcionalidades a objetos em tempo de execução, como adicionar comportamento extra a widgets GUI sem alterar a classe base.                         |
|                     | **Facade**                  | Fornece uma interface simplificada para um subsistema complexo.                                         | Simplificação do acesso a bibliotecas complexas ou APIs, como fornecer uma interface única para um conjunto de serviços relacionados.                        |
|                     | **Flyweight**               | Utiliza o compartilhamento para suportar eficientemente grandes quantidades de objetos granulares.         | Gestão eficiente de recursos em sistemas com muitos objetos semelhantes, como personagens de um jogo ou caracteres de um editor de texto.                    |
|                     | **Proxy**                   | Fornece um substituto ou representante para controlar o acesso a outro objeto.                            | Controle de acesso e gestão de recursos, como proxies de segurança, proxies remotos, ou proxies de cache.                                                    |
|    |    | ***(Comportamentais)*** |
|    | **Chain of Responsibility** | Evita o acoplamento do remetente de uma solicitação ao seu receptor, dando a mais de um objeto a chance de tratar a solicitação. | Implementação de sistemas de processamento de requisições, como processamento de eventos em uma interface gráfica ou middleware de uma aplicação web.         |
|                     | **Command**                 | Encapsula uma solicitação como um objeto, permitindo parametrizar clientes com diferentes solicitações.   | Implementação de comandos e operações reversíveis, como operações de desfazer/refazer em um editor de texto.                                                  |
|                     | **Interpreter**             | Define uma representação para a gramática de uma linguagem e um interpretador que usa a representação para interpretar sentenças da linguagem. | Implementação de linguagens de domínio específico (DSLs) ou interpretação de scripts.                                                                          |
|                     | **Iterator**                | Fornece uma maneira de acessar sequencialmente os elementos de um objeto agregado sem expor sua representação subjacente. | Navegação de coleções de objetos sem expor a estrutura interna dessas coleções.                                                                               |
|                     | **Mediator**                | Define um objeto que encapsula a forma como um conjunto de objetos interage.                             | Redução de dependências entre componentes, como a gestão de interações entre componentes de uma interface gráfica.                                            |
|                     | **Memento**                 | Captura e externaliza o estado interno de um objeto sem violar a encapsulação, permitindo que o objeto seja restaurado a esse estado mais tarde. | Implementação de mecanismos de salvamento e restauração de estados, como sistemas de salvamento em jogos ou versões de documentos.                           |
|                     | **Observer**                | Define uma dependência um-para-muitos entre objetos, de forma que quando um objeto muda de estado, todos os seus dependentes são notificados e atualizados automaticamente. | Implementação de sistemas de eventos ou notificações, como listeners de eventos em GUIs ou sistemas de publicação/assinatura.                                |
|                     | **State**                   | Permite que um objeto altere seu comportamento quando seu estado interno muda. Parece que o objeto mudou sua classe. | Implementação de máquinas de estados finitos, como gerenciamento de estados de objetos em jogos ou sistemas de transações.                                    |
|                     | **Strategy**                | Define uma família de algoritmos, encapsula cada um deles e os torna intercambiáveis. Permite que o algoritmo varie independentemente dos clientes que o utilizam. | Implementação de algoritmos intercambiáveis, como diferentes estratégias de ordenação, cálculos de rotas em sistemas de navegação, ou políticas de cache.    |
|                     | **Template Method**         | Define o esqueleto de um algoritmo em uma operação, postergando a definição de alguns passos para subclasses. | Criação de algoritmos com passos invariáveis e passos variáveis, como workflows de processamento de dados ou pipelines de compilação.                        |
|                     | **Visitor**                 | Representa uma operação a ser executada nos elementos de uma estrutura de objetos. Permite definir uma nova operação sem mudar as classes dos elementos sobre os quais opera. | Implementação de operações que precisam ser realizadas em diferentes tipos de elementos de uma estrutura, como operações de análise e transformação de árvores. |

Explicação:
- **Categoria**: A categoria do padrão (Criacionais, Estruturais, Comportamentais).
- **Padrão**: O nome do padrão de projeto.
- **Descrição**: Uma breve descrição do padrão e seu propósito.
- **Exemplo de Uso**: Um exemplo de aplicação prática do padrão.

Esta tabela cobre os principais padrões de projeto, suas definições e exemplos de uso, fornecendo uma visão geral útil para engenheiros de software que desejam aplicar esses conceitos em seus projetos.

##### Topicos a dominar
- **Técnicas de refatoração**
- **Designe Patterns**
- **SOLID**
- **Clean Code**
- **Dominio do funcionamento dos Frameworks**
