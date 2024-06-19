---
title: "Java e refatoração: melhorando códigos com boas práticas"
weight: 4
---

##### Refatorando com Java

Refatorando com Java
Caso deseje aprender a transformar um código onde temos somente a uma função em um código com boas práticas e testes, este é o lugar certo para você.

No exemplo exibido na tela, temos a função Main(), na qual se encontra todo o código com todas as regras de negócio e configurações. Nesse curso, transformaremos um código de função única em um código refatorado com organização em classes, pacotes e testes aplicados.

A classe, que antes acumulava todas as regras de negócio e configurações, se tornará mais enxuta e passará a utilizar o Switch, presente nas versões mais recentes do Java.

Veremos a divisão de classes com a utilização do Padrão de Projeto Command, com o intuito de fazer a requisição para as classes e métodos corretos no código. Também teremos classes específicas para configurações, onde nós utilizaremos uma API REST, fazendo chamadas GET e POST.

Separaremos classes específicas para cada tipo e faremos testes de unidade utilizando JUnit e Mockito.

Dessa forma, seremos capazes de aplicar diversos padrões e boas práticas para obter um código coeso e de fácil manutenção, tornando o seu desenvolvimento uma tarefa mais gratificante.

>Refatoração - Analisando o código
Conhecendo a Aplicação
A ideia desta aplicação é ser a ferramenta que as pessoas usuárias de nosso controle de adoção utilizarão para cadastrar abrigos, registrar animais para adoção e listá-los. Ou seja, é uma aplicação console voltada para a pessoa que trabalha manuseando o sistema de cadastro de animais e abrigos.

Acessando o IntelliJ e abrindo o arquivo do projeto, veremos no explorador de arquivos à esquerda que a aplicação é composta de uma única classe, chamada AdopetConsoleApplication, dentro do caminho de pastas "src > main > java > br.com.alura".

Vamos minimizar esse explorador clicando no ícone "-" chamado "Hide" (Esconder), localizado acima dele, alinhado à direita. Assim, podemos focar mais no código.

Após abrir o arquivo, veremos uma aplicação console tem uma função principal, ou main(). É por meio dela que iniciamos a função e a utilizamos para interagir com o sistema através do console.

Entre as chaves dessa função, temos um bloco while com algumas opções para interação:

- **Opção 1**: Listar abrigos cadastrados;
- **Opção 2**: Cadastrar novo abrigo;
- **Opção 3**: Listar pets do abrigo.
- **Opção 4**: Importar pets do abrigo;
- **Opção 5**: Sair.

Temos um codigo, que tem a simbologia de um codigo legado, com todas as regras em uma unica classe, que possui as seguintes operações:

- Opção 1: Listar abrigos cadastrados;
- Opção 2: Cadastrar novo abrigo;
- Opção 3: Listar pets do abrigo.
- Opção 4: Importar pets do abrigo;
- Opção 5: Sair.

O resultado é a abertura do terminal na aba inferior da IDE com a solicitação abaixo:

***DIGITE O NÚMERO DA OPERAÇÃO DESEJADA:***
***1 -> Listar abrigos cadastrados***
***2 -> Cadastrar novo abrigo***
***3 -> Listar pets do abrigo***
***4 -> Importar pets do abrigo***
***5 -> Sair***

```java
package br.com.mateus;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Scanner;

public class AdopetConsoleApplication {

    public static void main(String[] args) {
        System.out.println("##### BOAS VINDAS AO SISTEMA ADOPET CONSOLE #####");
        try {
            int opcaoEscolhida = 0;
            while (opcaoEscolhida != 5) {
                System.out.println("\nDIGITE O NÚMERO DA OPERAÇÃO DESEJADA:");
                System.out.println("1 -> Listar abrigos cadastrados");
                System.out.println("2 -> Cadastrar novo abrigo");
                System.out.println("3 -> Listar pets do abrigo");
                System.out.println("4 -> Importar pets do abrigo");
                System.out.println("5 -> Sair");

                String textoDigitado = new Scanner(System.in).nextLine();
                opcaoEscolhida = Integer.parseInt(textoDigitado);

                if (opcaoEscolhida == 1) {
                    HttpClient client = HttpClient.newHttpClient();
                    String uri = "http://localhost:8080/abrigos";
                    HttpRequest request = HttpRequest.newBuilder()
                            .uri(URI.create(uri))
                            .method("GET", HttpRequest.BodyPublishers.noBody())
                            .build();
                    HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                    String responseBody = response.body();
                    JsonArray jsonArray = JsonParser.parseString(responseBody).getAsJsonArray();
                    System.out.println("Abrigos cadastrados:");
                    for (JsonElement element : jsonArray) {
                        JsonObject jsonObject = element.getAsJsonObject();
                        long id = jsonObject.get("id").getAsLong();
                        String nome = jsonObject.get("nome").getAsString();
                        System.out.println(id +" - " +nome);
                    }
                } else if (opcaoEscolhida == 2) {
                    System.out.println("Digite o nome do abrigo:");
                    String nome = new Scanner(System.in).nextLine();
                    System.out.println("Digite o telefone do abrigo:");
                    String telefone = new Scanner(System.in).nextLine();
                    System.out.println("Digite o email do abrigo:");
                    String email = new Scanner(System.in).nextLine();

                    JsonObject json = new JsonObject();
                    json.addProperty("nome", nome);
                    json.addProperty("telefone", telefone);
                    json.addProperty("email", email);

                    HttpClient client = HttpClient.newHttpClient();
                    String uri = "http://localhost:8080/abrigos";
                    HttpRequest request = HttpRequest.newBuilder()
                            .uri(URI.create(uri))
                            .header("Content-Type", "application/json")
                            .method("POST", HttpRequest.BodyPublishers.ofString(json.toString()))
                            .build();

                    HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                    int statusCode = response.statusCode();
                    String responseBody = response.body();
                    if (statusCode == 200) {
                        System.out.println("Abrigo cadastrado com sucesso!");
                        System.out.println(responseBody);
                    } else if (statusCode == 400 || statusCode == 500) {
                        System.out.println("Erro ao cadastrar o abrigo:");
                        System.out.println(responseBody);
                    }
                } else if (opcaoEscolhida == 3) {
                    System.out.println("Digite o id ou nome do abrigo:");
                    String idOuNome = new Scanner(System.in).nextLine();

                    HttpClient client = HttpClient.newHttpClient();
                    String uri = "http://localhost:8080/abrigos/" +idOuNome +"/pets";
                    HttpRequest request = HttpRequest.newBuilder()
                            .uri(URI.create(uri))
                            .method("GET", HttpRequest.BodyPublishers.noBody())
                            .build();
                    HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                    int statusCode = response.statusCode();
                    if (statusCode == 404 || statusCode == 500) {
                        System.out.println("ID ou nome não cadastrado!");
                        continue;
                    }
                    String responseBody = response.body();
                    JsonArray jsonArray = JsonParser.parseString(responseBody).getAsJsonArray();
                    System.out.println("Pets cadastrados:");
                    for (JsonElement element : jsonArray) {
                        JsonObject jsonObject = element.getAsJsonObject();
                        long id = jsonObject.get("id").getAsLong();
                        String tipo = jsonObject.get("tipo").getAsString();
                        String nome = jsonObject.get("nome").getAsString();
                        String raca = jsonObject.get("raca").getAsString();
                        int idade = jsonObject.get("idade").getAsInt();
                        System.out.println(id +" - " +tipo +" - " +nome +" - " +raca +" - " +idade +" ano(s)");
                    }
                } else if (opcaoEscolhida == 4) {
                    System.out.println("Digite o id ou nome do abrigo:");
                    String idOuNome = new Scanner(System.in).nextLine();

                    System.out.println("Digite o nome do arquivo CSV:");
                    String nomeArquivo = new Scanner(System.in).nextLine();

                    BufferedReader reader;
                    try {
                        reader = new BufferedReader(new FileReader(nomeArquivo));
                    } catch (IOException e) {
                        System.out.println("Erro ao carregar o arquivo: " +nomeArquivo);
                        continue;
                    }
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] campos = line.split(",");
                        String tipo = campos[0];
                        String nome = campos[1];
                        String raca = campos[2];
                        int idade = Integer.parseInt(campos[3]);
                        String cor = campos[4];
                        Float peso = Float.parseFloat(campos[5]);

                        JsonObject json = new JsonObject();
                        json.addProperty("tipo", tipo.toUpperCase());
                        json.addProperty("nome", nome);
                        json.addProperty("raca", raca);
                        json.addProperty("idade", idade);
                        json.addProperty("cor", cor);
                        json.addProperty("peso", peso);

                        HttpClient client = HttpClient.newHttpClient();
                        String uri = "http://localhost:8080/abrigos/" + idOuNome + "/pets";
                        HttpRequest request = HttpRequest.newBuilder()
                                .uri(URI.create(uri))
                                .header("Content-Type", "application/json")
                                .method("POST", HttpRequest.BodyPublishers.ofString(json.toString()))
                                .build();

                        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                        int statusCode = response.statusCode();
                        String responseBody = response.body();
                        if (statusCode == 200) {
                            System.out.println("Pet cadastrado com sucesso: " + nome);
                        } else if (statusCode == 404) {
                            System.out.println("Id ou nome do abrigo não encontado!");
                            break;
                        } else if (statusCode == 400 || statusCode == 500) {
                            System.out.println("Erro ao cadastrar o pet: " + nome);
                            System.out.println(responseBody);
                            break;
                        }
                    }
                    reader.close();
                } else if (opcaoEscolhida == 5) {
                    break;
                } else {
                    System.out.println("NÚMERO INVÁLIDO!");
                    opcaoEscolhida = 0;
                }
            }
            System.out.println("Finalizando o programa...");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```


#### Segunda refatoração
>Codigo problematico
```java
package br.com.f1rst.challengereview.controller;

import br.com.f1rst.challengereview.model.Transacao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.io.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
*

Sistema de pontuação de compras
Existem quatro tipo de cartões; 1 - Silver, 2- Gold, 3- Platinum, 4- Unlimited
Cada um deles tem um esquema de pontuação diferente
O Silver dá 1 ponto a cada 5 reais gastos, apenas para compras feitas no débito-1
O Gold dá 2 pontos a cada 8 reais para as compras realizdas nos utlimos 20 dias (débito -1 ou Credito - 2)
O Platinum 1 ponto pora cada 1 real em compras realizadas no credito (2)
Unlimeted 2 ponto para cada 1 real em compras realizadas nos ultimos 90 dias.
Dado o tipo do cartão (Integer) e a lista de transações (arquivo) determinar quantos pontos foram computados
No cartão silver, se houver fração, arredondar para baixo
Nos demais, arredondar para cima
pix enviado;2;20000.12;2024-05-14T01:26:11.285925
compra no cartao;2;10.1;2024-05-14T01:26:11.285925
deposito;1;11.008;2024-05-14T01:26:11.285925
pix enviado;2;20000.12;2024-05-14T01:26:11.285925
*/

@Controller
@RequestMapping("/cartoes")
@AllArgsConstructor
public class Controller {

  private final PontosUseCase useCase;

  @ResponseBody
  @RequestMapping(value = "/pontos", method = RequestMethod.GET)
  public Integer buscarTransacoes(@RequestParam int tipoCartao) throws IOException {
      var resultado = useCase.getPontos(tipoCartao, "src/main/resources/transacoes.csv")
      return resultado;
  }
}

public class PontosUseCase {
public int getPontos(TipoCartao tipoCartao, String extratoFilePath) {

    int totalDePontos = 0;
    Transacao transacao = new Transacao();

    try {
        File file = new File(extratoFilePath);
        FileReader reader = new FileReader(file);
        BufferedReader br = new BufferedReader(reader);

        List<Transacao> transacoes = new ArrayList<>();

        String linha  = null;

        while((linha = br.readLine()) != null) {
            String[] movimentacao = linha.split(";");
            String desc =  movimentacao[0];
            Integer tipo = Integer.parseInt(movimentacao[1]);
            double valor = Double.parseDouble(movimentacao[2]);
            LocalDateTime dataHora = LocalDateTime.parse(movimentacao[3]);

            Transacao transacao = new Transacao();
            transacao.setDescricao(desc);
            transacao.setTipo(tipo);
            transacao.setValor(valor);
            transacao.setDataHora(dataHora);

            transacoes.add(transacao);
        }

        Double valorCompras = 0.0;

        var


        if (tipoCartao == 1) {

            for (Transacao transacao: transacoes) {
                if(transacao.getTipo() == 1) {
                    valorCompras += transacao.getValor();
                }
            }
            totalDePontos = valorCompras.intValue() /5;

        } else if (tipoCartao == 2) {

            for(Transacao transacao: transacoes) {
                if(transacao.getDataHora()
                        .isAfter(LocalDateTime.now()
                                .minusDays(20))) {

                    valorCompras += transacao.getValor();
                }
            }
            totalDePontos = (valorCompras.intValue() / 8) * 2;

        } else if(tipoCartao == 3) {

            for(Transacao transacao: transacoes) {
                if(transacao.getTipo() == 2) {
                    valorCompras += transacao.getValor();
                }
            }
            totalDePontos = valorCompras.intValue();

        } else {
            for(Transacao transacao: transacoes) {
                if(transacao.getDataHora()
                        .isAfter(LocalDateTime.now()
                                .minusDays(90))) {

                    valorCompras += transacao.getValor();
                }
            }
            totalDePontos = valorCompras.intValue() * 2;
        }

    } catch (Exception expcetion) {
          Exception("Erro ao realizar a operação", expcetion.message);
    }

    return totalDePontos;
  }
}
```

>Solução aplicando boas praticas
```java

package br.com.f1rst.challengereview.controller;

import br.com.f1rst.challengereview.model.Transacao;
import br.com.f1rst.challengereview.service.PontosService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.io.IOException;

@RestController
@RequestMapping("/cartoes")
@AllArgsConstructor
public class CartaoController {

    private final PontosService pontosService;

    @GetMapping("/pontos")
    public Integer buscarTransacoes(@RequestParam int tipoCartao) throws IOException {
        return pontosService.calcularPontos(tipoCartao, "src/main/resources/transacoes.csv");
    }
}

package br.com.f1rst.challengereview.service;

import br.com.f1rst.challengereview.model.Transacao;
import br.com.f1rst.challengereview.model.TipoCartao;
import br.com.f1rst.challengereview.repository.TransacaoRepository;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PontosService {

    private final TransacaoRepository transacaoRepository;

    public PontosService(TransacaoRepository transacaoRepository) {
        this.transacaoRepository = transacaoRepository;
    }

    public int calcularPontos(int tipoCartao, String extratoFilePath) throws IOException {
        List<Transacao> transacoes = transacaoRepository.lerTransacoes(extratoFilePath);
        double valorCompras = 0.0;

        switch (TipoCartao.fromTipo(tipoCartao)) {
            case SILVER:
                valorCompras = transacoes.stream()
                        .filter(t -> t.getTipo() == 1)
                        .mapToDouble(Transacao::getValor)
                        .sum();
                return (int) (valorCompras / 5);

            case GOLD:
                valorCompras = transacoes.stream()
                        .filter(t -> t.getDataHora().isAfter(LocalDateTime.now().minusDays(20)))
                        .mapToDouble(Transacao::getValor)
                        .sum();
                return (int) Math.ceil((valorCompras / 8) * 2);

            case PLATINUM:
                valorCompras = transacoes.stream()
                        .filter(t -> t.getTipo() == 2)
                        .mapToDouble(Transacao::getValor)
                        .sum();
                return (int) Math.ceil(valorCompras);

            case UNLIMITED:
                valorCompras = transacoes.stream()
                        .filter(t -> t.getDataHora().isAfter(LocalDateTime.now().minusDays(90)))
                        .mapToDouble(Transacao::getValor)
                        .sum();
                return (int) Math.ceil(valorCompras * 2);

            default:
                throw new IllegalArgumentException("Tipo de cartão inválido");
        }
    }
}

package br.com.f1rst.challengereview.repository;

import br.com.f1rst.challengereview.model.Transacao;
import org.springframework.stereotype.Repository;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Repository
public class TransacaoRepository {

    public List<Transacao> lerTransacoes(String extratoFilePath) throws IOException {
        List<Transacao> transacoes = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader(extratoFilePath))) {
            String linha;
            while ((linha = br.readLine()) != null) {
                String[] movimentacao = linha.split(";");
                String desc = movimentacao[0];
                int tipo = Integer.parseInt(movimentacao[1]);
                double valor = Double.parseDouble(movimentacao[2]);
                LocalDateTime dataHora = LocalDateTime.parse(movimentacao[3]);

                Transacao transacao = new Transacao(desc, tipo, valor, dataHora);
                transacoes.add(transacao);
            }
        }

        return transacoes;
    }
}

package br.com.f1rst.challengereview.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
public class Transacao {
    private String descricao;
    private int tipo;
    private double valor;
    private LocalDateTime dataHora;
}

package br.com.f1rst.challengereview.model;

public enum TipoCartao {
    SILVER(1),
    GOLD(2),
    PLATINUM(3),
    UNLIMITED(4);

    private final int tipo;

    TipoCartao(int tipo) {
        this.tipo = tipo;
    }

    public static TipoCartao fromTipo(int tipo) {
        for (TipoCartao cartao : values()) {
            if (cartao.tipo == tipo) {
                return cartao;
            }
        }
        throw new IllegalArgumentException("Tipo de cartão inválido: " + tipo);
    }
}
```

#### Topicos abordados
- Refatoração
- SOLID
- Criando domínios
- Testes automatizados
- Padrões de projetos: ***Command***

#### Referencia
https://www.alura.com.br/conteudo/java-refatoracao-melhorando-codigos-boas-praticas
