% Hechos
hombre(antonio).
hombre(juan).
hombre(luis).
hombre(rodrigo).
hombre(ricardo).
mujer(isabel).
mujer(ana).
mujer(marta).
mujer(carmen).
mujer(laura).
mujer(alicia).

matrimonio(antonio, ana).
matrimonio(juan, carmen).
matrimonio(luis, isabel).
matrimonio(rodrigo, laura).

hijos(antonio, juan).
hijos(antonio, rodrigo).
hijos(antonio, marta).
hijos(ana, juan).
hijos(ana, rodrigo).
hijos(ana, marta).
hija(carmen, luis, isabel).
hijo(ricardo, juan, carmen).
hija(alicia, rodrigo, isabel).

% Reglas
matrimonio(X, Y) :- matrimonio(Y, X).

nieto(Nieto, Abuelo) :- hijos(Padre, Nieto), hijos(Abuelo, Padre).
abuelos(Abuelo, Nieto) :- nieto(Nieto, Abuelo).
hermanos(Hermano1, Hermano2) :- hijos(Padre, Hermano1), hijos(Padre, Hermano2), Hermano1 \= Hermano2.
tios(Tio, Sobrino) :- hijos(Hijo, Sobrino), hermanos(Hijo, Tio).
tias(Tia, Sobrino) :- hija(Sobrino, Padre, Madre), hermanos(Madre, Tia).
primos(Primo1, Primo2) :- hijos(Padre1, Primo1), hijos(Padre2, Primo2), hermanos(Padre1, Padre2), Primo1 \= Primo2.
primas(Prima, Primo) :- hija(Prima, Padre, Madre), primos(Primo, Prima), Prima \= Primo.
suegros(Suegro, Yerno) :- matrimonio(Suegro, Hijo), hijos(Yerno, Hijo).
suegras(Suegra, Yerno) :- matrimonio(Suegra, Hijo), hija(Yerno, _, _).
