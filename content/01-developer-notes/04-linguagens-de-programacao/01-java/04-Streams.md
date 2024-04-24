---
title: "Streams"
weight: 4
---


<script src="https://gist.github.com/Uniliva/c44f6ac7856e24a4cea75c419ca06482.js"></script>

- Metodos uteis - min / max

```java
package streams;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

public class MinMax {
	public static void main(String[] args) {
		Aluno a1 = new Aluno("Ana", 7.1);
		Aluno a2 = new Aluno("Luna", 6.1);
		Aluno a3 = new Aluno("Gui", 8.1);
		Aluno a4 = new Aluno("Gabi", 10);
		
		List<Aluno> alunos = Arrays.asList(a1, a2, a3, a4);
		
		Comparator<Aluno> melhorNota = (aluno1, aluno2) -> {
			if(aluno1.nota > aluno2.nota) return 1;
			if(aluno1.nota < aluno2.nota) return -1;
			return 0;
		};

		Comparator<Aluno> piorNota = (aluno1, aluno2) -> {
			if(aluno1.nota > aluno2.nota) return -1;
			if(aluno1.nota < aluno2.nota) return 1;
			return 0;
		};
		
		System.out.println(alunos.stream().max(melhorNota).get());
		System.out.println(alunos.stream().min(piorNota).get());
		
		System.out.println(alunos.stream().min(melhorNota).get());
		System.out.println(alunos.stream().max(piorNota).get());
	}
}
```

Metodos uteis - limit / skip / distinct / takeWhile

```java
package streams;

import java.util.Arrays;
import java.util.List;

public class Outros {

	public static void main(String[] args) {
		Aluno a1 = new Aluno("Ana", 7.1);
		Aluno a2 = new Aluno("Luna", 6.1);
		Aluno a3 = new Aluno("Gui", 8.1);
		Aluno a4 = new Aluno("Gabi", 10);
		Aluno a5 = new Aluno("Ana", 7.1);
		Aluno a6 = new Aluno("Pedro", 9.1);
		Aluno a7 = new Aluno("Gui", 8.1);
		Aluno a8 = new Aluno("Maria", 10);
		
		List<Aluno> alunos = 
				Arrays.asList(a1, a2, a3, a4, a5, a6, a7, a8);
		
		System.out.println("distinct...");
        // recuperar os valores distintos (precisa do equals e hash code)
		alunos.stream().distinct().forEach(System.out::println);
		
		System.out.println("\nSkip/Limit");
		alunos.stream()
			.distinct()
			.skip(2) // pulo uma quantidade de itens
			.limit(2) // limita a quantidade de retorno
			.forEach(System.out::println);
		
		System.out.println("\ntakeWhile");
		alunos.stream()
			.distinct()
			.skip(2)
			.takeWhile(a -> a.nota >= 7) // retorna ate achar a condição
			.forEach(System.out::println);
	}
}
```

