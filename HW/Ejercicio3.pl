% Predicado para encontrar el mínimo entre dos números
minimo(X, Y, Min) :- X =< Y, Min is X.
minimo(X, Y, Min) :- Y < X, Min is Y.

% Predicado para calcular el área de un círculo
area_circulo(Radio, Area) :- Area is pi * Radio * Radio.

% Predicado para calcular el área de un trapecio
area_trapecio(BaseMayor, BaseMenor, Altura, Area) :- Area is ((BaseMayor + BaseMenor) * Altura) / 2.

% Predicado para calcular el producto de los números entre dos dados
producto_entre_numeros(Inicio, Fin, Producto) :-
    Inicio =< Fin,
    producto_entre_numeros_aux(Inicio, Fin, Producto).

producto_entre_numeros_aux(Inicio, Fin, Producto) :-
    Inicio =:= Fin,
    Producto is Inicio.
producto_entre_numeros_aux(Inicio, Fin, Producto) :-
    Inicio < Fin,
    Siguiente is Inicio + 1,
    producto_entre_numeros_aux(Siguiente, Fin, ProductoSiguiente),
    Producto is Inicio * ProductoSiguiente.
