% programa 51
progressao_aritmetica(A, B, Step, [A|T]) :-
    B >= A,
    Next is A+Step,
    progressao_aritmetica(Next, B, Step, T), !.
progressao_aritmetica(_, _, _, []).

% programa 52
progressao_geometrica(_, 0, _, []) :- !.
progressao_geometrica(A, N, Step, [A|T]) :-
    N > 0,
    Next_A is A*Step,
    Next_N is N-1,
    progressao_geometrica(Next_A, Next_N, Step, T).

% programa 53
progressao_1(N, R) :- progressao_1(1, 1, N, R).

progressao_1(A, Step, N, [A|T]) :-
    N >= A,
    Next_A is A+Step,
    Next_Step is Step+1,
    progressao_1(Next_A, Next_Step, N, T), !.
progressao_1(_, _, _, []).

% programa 54
progressao_2(N, R) :- progressao_2(1, N, R).

progressao_2(A, N, [A|T]) :-
    N >= A,
    Next_A is ((A**2)+1),
    progressao_2(Next_A, N, T), !.
progressao_2(_, _, []).

% programa 55
soma([], 0).
soma([H|T], R) :-
    soma(T, Y),
    R is Y+H, !.

soma_cem_primeiros(R) :-
    progressao_aritmetica(1, 100, 1, X),
    soma(X, R).

% Programa 56
produto_escalar([], [], 0).
produto_escalar([H|T], [H2|T2], R):-
    produto_escalar(T, T2, X),
    R is H*H2 + X.

% Programa 57
remover([], _, []).
remover([H|T], H, T) :- !.
remover([H|T], X, [H|T2]) :- remover(T, X, T2).

e_permutacao(X, Y) :- length(X, A), length(Y, B), A is B, e_permutacao(X, Y, _).

e_permutacao([], _, _).
e_permutacao([H|T], X, R) :-
    member(H, X),
    e_permutacao(T, X, R), !.

% Programa 59
permutacoes([], []).
permutacoes([H|T], R) :-
    !, permutacoes(T, X),
    select(H, R, X).

% Programa 60
combinacoes([], []).
combinacoes([H|T], [H|T2]) :-
    combinacoes(T, T2).
combinacoes([_|T], T2) :-
    combinacoes(T, T2).
