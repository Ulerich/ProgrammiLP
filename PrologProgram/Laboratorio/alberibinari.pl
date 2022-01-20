is_node(void).
is_node(node(_Key, _Value, NLeft, NRight)) :-
    is_node(NLeft),
    is_node(NRight).
%albero vuoto

is_leaf(node(_K, _V, void, void)).

node_search(node(Key, Value, _L, _R), Key, Value) :- !.

node_search(node(NK, _, NL, NR), Key, Value) :-
    Key < NK, !,
    node_search(NL, Key, Value).

node_search(node(NK, _, NL, NR), Key, Value) :-
    Key > NK, !,
    node_search(NR, Key, Value).

node_insert(void, K, V, node(K, V, void, void)). %caso base
node_insert(node(NK, _, NL, NR), NK, node(NK, V, NL, NR)). %passi induttivi, questo è per quando la key c'è già e sostituisco il valore
node_insert(node(Key, Value, _L, _R), Key, Value,
	    node(NK, NV, NL, NewR)) :-
    NK < Key,
    node_insert(NR, Key, Value, NewR).

node_insert(node(Key, Value, _L, _R), Key, Value,
	    node(NK, NV, NewL, NR)) :-
    NK > Key,
    node_insert(NR, Key, Value, NewL).

%treemap(Id, Root).

is_treemap(treemap(_ID, Root)) :- is_node(Root).
new_treemap(Id) :- assert(treemap(Id, void)).
del_treemap(Id) :- retract(treemap(Id, _Root)).

treemap_search(Id, Key, Value) :-
    treemap(Id, Root),
    node_search(Root, Key, Value).

treemap_insert(Id, Key, Value) :-
    treemap(Id, Root),
    node_insert(Root, Key, Value, NewRoot),
    retract(treemap(Id, Root)),
    assert(treemap(Id, NewRoot)).
%%% tremap minimun

treemap_print(Id) :-
    treemap(Id, Root),
    node_print(Root, 0).

node_print(void, _).
node_print(node(Key, Value, Left, Right), Level) :-
    tab(Level), %stampa tanti spazi quanti Level
    write(Key),
    write(' => '),
    write(Value),
    nl,
    L1 is Level + 4,
    node_print(Left, L1),
    node_print(Right, L1).
