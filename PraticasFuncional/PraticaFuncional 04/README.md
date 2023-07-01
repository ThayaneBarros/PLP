# 📜 Prática Funcional 4

## 📝 Descrição

Pedrinho é um aluno de computação na UFCG e recentemente se interessou em estudar sobre mecanismos de buscas feitas na internet, como em ferramentas como o Google.

Estudando sobre mecanismos de busca, um dos primeiros termos que Pedrinho conheceu foram as stopwords. Stopwords são palavras que podem ser totalmente omitidas ou ocultadas na hora de se fazer uma busca na internet sem que o sentido do que se quer encontrar seja perdido.

Pedrinho notou que muitas das palavras de 3 ou menos letras estão presentes entre as stopwords e como experimento inicial ele decidiu implementar um filtro que retira tais palavras, para checar em quais casos essa métrica deu ou não bons resultados.

Assim como Pedrinho, faça um programa Haskell que recebe um texto e elimina palavras com 3 ou menos caracteres. Para nível de simplificação, considere que os sinais de pontuação contam como caracteres. Logo, a palavra "sim" deveria ser excluída, mas "sim." não deveria.

## 📤 Input

```
Jorge foi comprar bolo, mas esqueceu do dinheiro que levaria para a padaria. Ele entao voltou para casa, foi ate seu quarto, onde antes estava o dinheiro, pegou 10 reais e levou novamente a padaria. Quando chegou la, o bolo que ele queria ja havia sido vendido. Jorge ficou muito triste.
```

## 📥 Output

```
Jorge comprar bolo, esqueceu dinheiro levaria para padaria. entao voltou para casa, quarto, onde antes estava dinheiro, pegou reais levou novamente padaria. Quando chegou bolo queria havia sido vendido. Jorge ficou muito triste.
```
