% Programa 11
imprime_serie(A, B) :-
    B >= A,
    write(A),
    write(" "),
    Next is A+1,
    imprime_serie(Next, B), !.

% Programa 12
ackermann(0, N, R) :- R is N+1.
ackermann(M, 0, R) :- A is M-1, ackermann(A, 1, R).
ackermann(M, N, R) :-
    A is M-1,
    B is N-1,
    ackermann(M, B, X),
    ackermann(A, X, R), !.

% Programa 13
converter_para(Numero, Base, R) :-
    Numero < Base,
    R is Numero, !.
converter_para(Numero, Base, R) :-
    Next is div(Numero, Base),
    Resto is mod(Numero, Base),
    converter_para(Next, Base, Y),
    R is Resto + 10*Y.

% Programa 14


% Programa 15
imprime_ate(N) :- imprime_ate(N, 0).
imprime_ate(N, Acc) :-
    Acc =< N,
    write(Acc),
    write(" "),
    Next is Acc+1,
    imprime_ate(N, Next), !.

% Programa 16
imprime_de(N) :-
    N >= 0,
    write(N),
    write(" "),
    Next is N-1,
    imprime_de(Next), !.

% Programa 17
divisores(X) :- Acc is 1, divisores(X, Acc).
divisores(X, Acc) :-
    0 is mod(X, Acc),
    write(Acc),
    write(" ").
divisores(X, Acc) :-
    X >= Acc,
    Next is Acc+1,
    divisores(X, Next).

% Programa 18
mdc(A, B, R) :- Acc is A, mdc(A, B, Acc, R).
mdc(A, B, Acc, R) :-
    Acc > 0,
    0 is mod(A, Acc),
    0 is mod(B, Acc),
    R is Acc, !.
mdc(A, B, Acc, R) :-
    Next is Acc-1,
    mdc(A, B, Next, R).
    
% Programa 19
mmc(A, B, R) :- Acc is 1, mmc(A, B, Acc, R).
mmc(A, B, Acc, R) :-
    X is A*Acc,
    0 is mod(X, B),
    R is X, !.
mmc(A, B, Acc, R) :-
    Next is Acc+1,
    mmc(A, B, Next, R).

% Programa 20
palindromo(X) :- reverse(X, X).
