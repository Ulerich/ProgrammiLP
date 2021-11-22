pesce(X) :- animale(X), ha_le_squame(X).
cane(X) :- animale(X), pelo(X).

pelo(harvey).
animale(harvey).
animale(goldy).
ha_le_squame(goldy).
