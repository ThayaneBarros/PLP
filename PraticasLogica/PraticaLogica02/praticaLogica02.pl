main :-
  read(Preco),
  pegaEntrada('a', 0, 0, 0, R, QtdUniforme),
  NovoPreco is Preco * QtdUniforme,
  Desconto is (NovoPreco * R) / 100,
  Resultado is NovoPreco - Desconto,
  format('~2f', [Resultado]),
  nl,
  halt.
  
  pegaEntrada(-1, P, M, G, R, Qtd) :-
  calculaPorcetagem(P, M, G, R),
  Qtd is (M + G + P).
  
  pegaEntrada(Entrada, P, M, G, R, Qtd) :-
  incrementaTamanho(Entrada, P, M, G, NovoP, NovoM, NovoG),
  read(NovaEntrada),
  pegaEntrada(NovaEntrada, NovoP, NovoM, NovoG, R, Qtd).
  
  incrementaTamanho('p', P, M, G, NovoP, M, G) :-
  NovoP is P + 1.
  
  incrementaTamanho('m', P, M, G, P, NovoM, G) :-
  NovoM is M + 1.
  
  incrementaTamanho('g', P, M, G, P, M, NovoG) :-
  NovoG is G + 1.
  
  incrementaTamanho(_, P, M, G, P, M, G).
  
  calculaPorcetagem(P, M, G, R) :-
  calculaP(P, RP),
  calculaM(M, RM),
  calculaG(G, RG),
  R is RP + RM + RG.
  
  calculaP(P, 8) :- P >= 4.
  calculaP(_, 0).
  
  calculaM(M, 6) :- M >= 4.
  calculaM(_, 0).
  
  calculaG(G, 4) :- G >= 4.
  calculaG(_, 0).