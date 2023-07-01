main :- 
  read(Matriz),
  posMaior(Matriz, 0, _, Linha, Coluna),
  write(Linha), write(" "), writeln(Coluna),
  halt.
  
  posMaior([], _, _, _) :- !.
  posMaior([X|[]], I, Maior, Linha, Coluna) :- procuraMaior(X, 0, Maior, Coluna), Linha is I + 1.
  posMaior([H|T], I, MaiorAtua, LinhaAtua, ColunaAtua) :-
      IndAux is I + 1,
      posMaior(T, IndAux, Maior2, Linha, Coluna2),
      procuraMaior(H, 0, Maior, Coluna),
      (Maior2 >= Maior -> LinhaAtua = Linha, MaiorAtua = Maior2, ColunaAtua = Coluna2;
      LinhaAtua = IndAux, MaiorAtua = Maior, ColunaAtua = Coluna).
      
  procuraMaior([], _, _, _) :- !.
  procuraMaior([H|[]], I, H, Coluna) :- Coluna is I + 1.
  procuraMaior([H|T], I, R, C) :-
      IndAux is I + 1,
      procuraMaior(T, IndAux, R2, Coluna),
      (H >= R2 -> R = H, C = IndAux;
      R = R2, C is Coluna).