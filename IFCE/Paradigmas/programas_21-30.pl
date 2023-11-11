% Programas 21 e 23 (questões repetidas)
min([Min], Min).
min([A,B|T], Min) :-
    A > B,
    min([B|T], Min), !.
min([A,B|T], Min) :-
    A < B,
    min([A|T], Min), !.

% Programa 22
max([Max], Max).
max([A,B|T], Max) :-
    A > B,
    max([A|T], Max), !.
max([A,B|T], Max) :-
    A < B,
    max([B|T], Max), !.

% Programa 24
remover(_, [], []).
remover(R, [R|T], T2) :- remover(R, T, T2).
remover(R, [H|T], [H|T2]) :- H \= R, remover(R, T, T2).

% Programa 25
top2(X, Max1, Max2) :-
    max(X, Max1),
    remover(Max1, X, Y),
    max(Y, Max2).

% Programa 27
soma([], 0).
soma([H|T], R) :-
    soma(T, Y),
    R is Y+H, !.

% Programa 28
tamanho([], 0).
tamanho([_|T], R) :-
    tamanho(T, Y),
    R is Y+1, !.

% Programas 26 e 29 (questões repetidas)
media(X, R) :-
    soma(X, Y),
    tamanho(X, L),
    R is Y/L.

% Programa 30
amplitude([A,B|T], R) :- amplitude([A,B|T], 0, R).

amplitude([], Max, R) :- R is Max.
amplitude([A,B|T], Max, R) :-
    Distance is abs(A-B),
    Distance > Max,
    New_max is Distance,
    amplitude([B|T], New_max, R).
amplitude([_,B|T], Max, R) :-
    amplitude([B|T], Max, R).
