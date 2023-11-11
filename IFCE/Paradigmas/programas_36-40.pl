% Programa 36
prefixo(_, []) :- !.
prefixo([H|T], [X|Y]) :-
    H is X,
    prefixo(T, Y).

sublista([H|T], X) :-
    prefixo([H|T], X), !.
sublista([_|T], X) :-
    sublista(T, X).

% Programa 37
takeout(X,[X|R],R).  
takeout(X,[F|R],[F|S]) :- takeout(X,R,S).

permuta([X|Y], R) :- permuta(Y, A), takeout(X, R, A).  
permuta([],[]).

% Programa 38
remover([], _, []).
remover([H|T], H, T) :- !.
remover([H|T], X, [H|T2]) :- remover(T, X, T2).

% Programa 39
remover_na_posicao([_|T], 0, T) :- !.
remover_na_posicao([H|T], X, [H|T2]) :-
    Next is X-1,
    remover_na_posicao(T, Next, T2).

remover_aleatorio(X, R) :-
    length(X, Length),
    I is random(Length),
    remover_na_posicao(X, I, R).

% Programa 40
remove_duplicates([], []).
remove_duplicates([H|T], R) :-
    member(H, T), !,
    remove_duplicates(T, R).
remove_duplicates([H|T], [H|R]) :-
    remove_duplicates(T, R).
