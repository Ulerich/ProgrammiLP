last_element(X, [X]). %l'ultimo elemento di una lista è se stesso
last_element(X, [_ | Xs]):-
    last_element(X, Xs).

is_a_list([]).
is_a_list([_ | _]).

concatenate([], L, L).
concatenate([X | Xs], L, [X | L2]) :-
    concatenate(Xs, L, L2).

belongs(X, [X | _]).
belongs(X, [Y | Ys]) :-
    X \=  Y,
    belongs(X, Ys).

len([], 0). %il caso base è che la lista vuota ha lunghezza zero
len([_ | Xs], N) :-
    len(Xs, M),
    N is M + 1.

lref([X | _], 0, X). %il caso base è quando arrivo alla fine della lista e ho trovato l'emlemento
% se così non fosse significa che ho fatto scorrere tutta la lista e non ho trovato l'elemento
lref([_ | Xs], P, X) :-
    P > 0,
    Q is P - 1,
    lref(Xs, Q, X).

remove(_, [], []). %caso base è la lista senza elemento, perchè o l'ho già tolto o ho una lista senza elemento
remove(X, [X | Xs], Xs) :- %inserisco _ al posto di X per eliminare il warning (singleton variable, variabile inutilizzata
    remove(X, Xs, Y).
remove(X, [Y | Ys], [Y | Z]) :-
    X \= Y, %faccio il check, così tutto ciò che viene eseguito dopo sono sicuro che rispetta questa condizione
    remove(X, Ys, Z).

ordered([]).
ordered(_).
ordered([X, Y | Xs]) :-
    X =< Y,
    ordered([Y | Xs]).

list_reverse(L, R) :-
    aux_reverse(L, R, []).
aux_reverse([], L, L).
aux_reverse([X | Xs], L, Acc) :- aux_reverse(Xs, L, [X | Acc]).
