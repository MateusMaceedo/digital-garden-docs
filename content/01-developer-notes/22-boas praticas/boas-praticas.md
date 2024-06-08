---
title: "Boas praticas e processo continuo"
weight: 2
---

Ao longo dos projetos que participei e contribuições que fiz, me deparei com alguns problemas que atrapalham diretamente a vida de quem esta na linha de frente, muita das vezes não se trata de conhecimento tecnico, e sim de comportamento. Deixo aqui as minhas observações sobre temas como, code review, system designer, agil, planejamento e prazos, refinamentos etc.

>Deixando claro, que essa é a minha visão com base na minha experiência pratica em projetos grandes.

Para mim um bom code review, precisa ser construtivo ao ponto de melhorar a performance do codigo, exemplo porque usa um if aqui se você poderia tomar essa decisão antes, levando em consideração que a resposta já começa no inicio do seu usecase, em projeto pequeno talvez isso não importaria, mais pense nisso em um fluxo assincrono, aonde você tem 1M de TPS por hora, faz diferença ?

Então o primeiro ponto é, a alteração tras algum valor pro fluxo, tornara ele mais performatico ? Se sim, alteramos, se não é somente sugestão e escrita melhor do codigo, mais lembre de uma coisa, cada dev tem a sua forma de desenvolver o seu codigo, uns com menos recursos, somente com o arroz e feijão, e outros com mais abstrações e afins, vale a maturidade para entender, o quão de abstração podemos colocar no nosso código, que muita das vezes será compartilhado entre varios devs de todo tipo de experiência.

A pergunta é, como ter um bom code review então ?

Primeiro vamos falar de boas praticas, o que muitas das vezes é ignorado por muitos, esta ai o motivo de termos codigo menos performatico, e mais recursos computacionais sendo disperdiçados atoa.

##### Referências
- https://dev.to/christiantld/boas-praticas-de-code-review-para-bons-programadores-3999
