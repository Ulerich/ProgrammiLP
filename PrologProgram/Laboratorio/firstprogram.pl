ct(X,Y) :- r(X,Y).
ct(X,Y) :- r(Z,Y), ct(X,Z).
r(c, d).
r(a, b).

