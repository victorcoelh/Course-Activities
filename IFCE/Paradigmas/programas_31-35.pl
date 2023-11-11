% Programa 31
soma([], 0).
soma([H|T], R) :-
    soma(T, Y),
    R is Y+H, !.

tamanho([], 0).
tamanho([_|T], R) :-
    tamanho(T, Y),
    R is Y+1, !.

media(X, R) :-
    soma(X, Y),
    tamanho(X, L),
    R is Y/L.

variancia(X, R) :- media(X, M), tamanho(X, N), variancia(X, M, 0, N, R).
variancia([], _, V, N, R) :- R is (V / (N-1)), !.
variancia([H|T], M, V, N, R) :-
    Var is ((H-M)**2),
    Ans is V + Var,
    variancia(T, M, Ans, N, R).

sd(X, R) :-
    variancia(X, Var),
    R is sqrt(Var).

% Programa 32
min([Min], Min).
min([A,B|T], Min) :-
    A > B,
    min([B|T], Min), !.
min([A,B|T], Min) :-
    A < B,
    min([A|T], Min), !.

max([Max], Max).
max([A,B|T], Max) :-
    A > B,
    max([A|T], Max), !.
max([A,B|T], Max) :-
    A < B,
    max([B|T], Max), !.

amplitude_total(X, R) :-
    max(X, Max),
    min(X, Min),
    R is Max - Min.

% Programa 33
concat([], X, X).
concat([H|T], X, [H|R]) :-
    concat(T, X, R).

% Programa 34
prefixo(_, []) :- !.
prefixo([H|T], [X|Y]) :-
    H is X,
    prefixo(T, Y).

% Programa 35
sufixo(X, X) :- !.
sufixo([_|T], X) :-
    sufixo(T, X).
