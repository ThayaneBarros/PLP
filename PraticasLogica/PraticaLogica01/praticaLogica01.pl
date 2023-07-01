main :-
  read(N),
  calcula(N, F, C, A),
  write('Floor de '), write(N), write(' = '), writeln(F),
  write('Ceil de '), write(N), write(' = '), writeln(C),
  write('Abs de '), write(N), write(' = '), write(A),
  halt.
  
  calcula(N, F, C, A):- N - truncate(N) =:= 0,
  F is N,
  C is N,
  abs(N,A).
  
  calcula(N, F, C, A):- 
  floor(N,F),
  ceil(N,C),
  abs(N,A).
  
  floor(N,F) :- N >= 0,
  F is truncate(N).
  
  floor(N,F) :- F is truncate(N) - 1.
  
  ceil(N,C) :- N >= 0,
  C is truncate(N) + 1.
  
  ceil(N,C) :- C is truncate(N).
  
  abs(N,A) :- N >= 0,
  A is N.
  
  abs(N,A) :- A is N * (-1).