%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parte 2 - La copa de las casas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 :-style_check(-discontiguous).

esDe(hermione, gryffindor).
esDe(ron, gryffindor).
esDe(harry, gryffindor).
esDe(draco, slytherin).
esDe(luna, ravenclaw).


esBuenAlumno(Alumno,Accion):-
    esDe(Alumno,_),
    not(esMalaAccion(Accion)).

esMalaAccion(accion(_,Puntaje)):-
    Puntaje < 0.

esRecurrente(Accion):-
    esDe(Alumno,_),
    esDe(Alumno2,_),
    Alumno \= Alumno2,
    hizo(Alumno,Accion),
    hizo(Alumno2,Accion).

puntajeTotalCasa(Casa, PuntajeTotalCasa):-
    esDe(_,Casa),
    findall(Puntaje, (esDe(Alumno,Casa), hizo(Alumno,accion(_,Puntaje))), Puntajes),
    sumlist(Puntajes, PuntajeTotalCasa).

casaGanadora(Casa):-
    puntajeTotalCasa(Casa,PuntajeCasa),
    forall(esDe(_,Casas),(puntajeTotalCasa(Casas, Puntajes),Puntajes < PuntajeCasa)).



    























