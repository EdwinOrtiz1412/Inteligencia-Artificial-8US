
% Hechos
ama(juan, ana).
ama(ana, miguel).
ama(luis, isabel).
ama(miguel, ana).
ama(laura, juan).
ama(isabel, luis).

% Reglas
amantes(X, Y) :- ama(X, Y), ama(Y, X).

% Preguntas
% ¿A quién ama "Juan"?
quien_ama_a_juan :- ama(juan, X), write(X), nl.

% ¿Quién ama a "Ana"?
quien_ama_a_ana :- ama(X, ana), write(X), nl.

% ¿Quién ama a alguien?
quien_ama_a_alguien :- ama(X, _), write(X), nl.

% ¿Quién es amado por alguien?
quien_es_amado_por_alguien :- ama(_, X), write(X), nl.

% ¿Quiénes se aman mutuamente?
quienes_se_aman_mutuamente :- amantes(X, Y), write(X), write(' y '), write(Y), nl.

% ¿Quién ama sin ser correspondido?
quien_ama_sin_ser_correspondido :- ama(X, Y), \+ ama(Y, X), write(X), nl.
