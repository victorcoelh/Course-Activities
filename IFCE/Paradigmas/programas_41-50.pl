% programa 41
compacta(X, R) :- compacta(X, 1, R).

compacta([], _, []).
compacta([X], Acc, [[X, Acc]]).
compacta([H1,H2|T], Acc, [[H1, Acc]|T2]) :-
    H1 \= H2,
    compacta([H2|T], 1, T2), !.
compacta([H1,H1|T], Acc, R) :-
    Next is Acc+1,
    compacta([H1|T], Next, R).    

% programa 42
concatena([], X, [X]).
concatena([H|T], X, [H|T2]) :- concatena(T, X, T2).

inverte_lista([], []).
inverte_lista([H|T], R) :- reverse(T, Y), concatena(Y, H, R).

% programa 43
min([Min], Min).
min([A,B|T], Min) :-
    A > B,
    min([B|T], Min), !.
min([A,B|T], Min) :-
    A < B,
    min([A|T], Min), !.

remover([], _, []).
remover([H|T], H, T) :- !.
remover([H|T], X, [H|T2]) :- remover(T, X, T2).

selection_sort([], []).
selection_sort(X, [Min|T]) :-
    min(X, Min),
    remover(X, Min, Y),
    selection_sort(Y, T), !.

% programa 44
insert(X, [], [X]).
insert(X, [H|T], [X,H|T]) :-
    X < H, !.
insert(X, [H|T], [H|T2]) :-
    insert(X, T, T2), !.

insertion_sort(X, R) :- insertion_sort(X, [], R).

insertion_sort([], List, List).
insertion_sort([H|T], List, R) :-
    insert(H, List, Next),
    insertion_sort(T, Next, R), !.
    

% programa 45


% programa 46


% programa 47



% os programas 48, 49, 50 não estão presentes na lista original