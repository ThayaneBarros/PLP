main :-
  read(Lista),
  read(N),
  calcula(N, Lista, [+, -, *, /], R),
  writeln(R),
  halt.
  
  calcula(N1, L, [], R) :- calcula(N1, L, [+, -, *, /], R).
  calcula(N1, [], _, N1).
  calcula(N1, [L|L1], [OP|OPL], R) :- 
  aplicaOperacao(N1, L, OP, N2),
  calcula(N2, L1, OPL, R).
  
  aplicaOperacao(N1, L, +, N2) :- N2 is N1 + L.
  aplicaOperacao(N1, L, -, N2) :- N2 is N1 - L.
  aplicaOperacao(N1, L, /, N2) :- L =\= 0, N2 is N1 / L.
  aplicaOperacao(N1, _, /, N1).
  aplicaOperacao(N1, L, *, N2) :- N2 is N1 * L.