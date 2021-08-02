%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parte 2 - La copa de las casas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 :-style_check(-discontiguous).
esDe/2.

esDe(hermione, gryffindor).
esDe(ron, gryffindor).
esDe(harry, gryffindor).
esDe(draco, slytherin).
esDe(luna, ravenclaw).

hizo/2.

hizo(harry,accion(andarDeNoche,-50)).
hizo(hermione,accion(irTercerPiso,-75)).
hizo(hermione,accion(irTercerPiso,-10)).
hizo(harry,accion(irBosque,-50)).
hizo(harry,accion(irTercerPiso,-10)).
hizo(draco,accion(mazmorras,0)).
hizo(ron,accion(ganarAjedrez,50)).
hizo(harry,accion(andarDeNoche,-50)).
hizo(hermione,accion(usarIntelecto,50)).
hizo(harry,accion(ganarVoldemort,60)).


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














