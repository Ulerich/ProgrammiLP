%regole
madre(X, Y) :- genitore(X, Y),
	       femmina(X).
nonno(X, Y) :- genitore(X, Z),
	       genitore(Z, Y),
	       maschio(X).
nonna(X, Y) :- genitore(X, Z),
	       genitore(Z, Y),
	       femmina(X).
sorella(X, Y) :- genitore(Z, X),
		 genitore(Z, Y),
		 femmina(X),
		 X\=Y.
fratello(X, Y) :- genitore(Z, X),
		  genitore(Z, Y),
		  maschio(X),
		  X\=Y.

antenato(X, Y) :- genitore(Z, Y), antenato(X, Z). %funzione ricorsiva
antenato(X, Y) :- genitore(X, Y). %caso base ricorsione

%fatti
genitore(anna, bob).
genitore(anna, claudia).
genitore(bob, daniela).
genitore(daniela, sara).
genitore(sara, marco).
femmina(anna).
femmina(claudia).
femmina(daniela).
femmina(sara).
maschio(bob).
maschio(marco).
