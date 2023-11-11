% programa 1
media(A, B, C) :- C is (A+B)/2.

% programa 2
max(A, B, C, R) :- max(A, B, X), max(X, C, R).
max(A, B, R) :- A > B, R is A, !.
max(A, B, R) :- B >= A, R is B.

min(A, B, C, R) :- min(A, B, X), min(X, C, R).
min(A, B, R) :- A < B, R is A, !.
min(A, B, R) :- B =< A, R is B.

select_min_max(A, B, C, Min, Max) :- min(A,B,C,Min), max(A,B,C,Max).

% programa 3 - retorna false se delta negativo
delta(A, B, C, D):- D is (B*B) - (4*A*C).
raiz(A, B, C, X1, X2):-
    delta(A, B, C, D),
    D >= 0,
    X1 is (0-B+ sqrt(D))/(2*A),
    X2 is (0-B- sqrt(D))/(2*A).

% programa 4
par(X) :- 0 is mod(X, 2).
impar(X) :- par(X+1).

% programa 5
entre(X, A, B) :- X >= A, X =< B, !.

% programa 6
entre(X, A, B) :- X >= B, X =< A.

% programa 7 - com a query triplo(12, Y), o programa quebra.
triplo(X, Y) :- X is Y*3.

% programa 8
sucessor(X, Y) :- X is Y+1.

% programa 9
fatorial(1, 1).
fatorial(X, Y) :- A is X-1, fatorial(A, B), Y is X*B, !.

% programa 10 - imprime a sequência de fibonacci ao contrário
fibonacci(-1) :- !.
fibonacci(X) :-
    X>=0,
    A is X-1,
    fibonacci(X, Y),
    write(Y),
    write(" "),
    fibonacci(A).

fibonacci(0, Y) :- Y is 0.
fibonacci(1, Y) :- Y is 1.
fibonacci(X, Y) :-
    A is X-1, B is X-2,
    fibonacci(A, C),
    fibonacci(B, D),
    Y is C+D, !.
