collega(X, Y) :-
    lavora(X, Z),
    lavora(Y, Z),
    Y \== X.

genitore(X, Y) :-
    mamma(Y, X),
    padre(Z, X).

lavora(ciro, ibm).
lavora(ugo, ibm).
lavora(olivia, ibm).
lavora(ernesto, olivetti).
lavora(enrica, samsung).
donna(olivia).
donna(enrica).
uomo(ciro).
uomo(ernesto).
uomo(ugo).
mamma(olivia, ciro).
padre(ernesto, ciro).

