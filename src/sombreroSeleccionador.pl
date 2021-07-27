%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parte 1 - Sombrero Seleccionador
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



esMestizo(harry).
esCorajudo(harry).
esAmistoso(harry).
esOrgulloso(harry).
esInteligente(harry).
odiaCasa(harry,slytherin).

esMestizo(harry).
esCorajudo(harry).
esAmistoso(harry).
esOrgulloso(harry).
esInteligente(harry).
odiaCasa(harry,slytherin).

esPuro(draco).
esOrgulloso(draco).
esInteligente(draco).
odiaCasa(draco,hufflepuff).

esImpuro(hermione).
esOrgulloso(hermione).
esInteligente(hermione).
esResponsable(hermione).


casa(gryffindor).
casa(ravenclaw).
casa(slytherin).
casa(hufflepuff).

mago(harry).
mago(draco).
mago(hermione).

sombrero/2.

sombrero(gryffindor,Mago):-
    esCorajudo(Mago).

sombrero(slytherin,Mago):-
    esInteligente(Mago),
    esOrgulloso(Mago).

sombrero(ravenclaw,Mago):-
    esInteligente(Mago),
    esResponsable(Mago).

sombrero(hufflepuff,Mago):-
    esAmistoso(Mago).

permiteEntrar(Mago,Casa):-
    mago(Mago),
    casa(Casa).

permiteEntrar(Mago,slytherin):-
    not(esImpuro(Mago)).

tieneCaracterPara(Casa,Mago):-
    sombrero(Casa,Mago).

podriaQuedarEn(Mago,Casa):-
    tieneCaracterPara(Casa,Mago),
    permiteEntrar(Mago,Casa),
    not(odiaCasa(Mago,Casa)).

podriaQuedarEn(hermione,gryffindor).

cadenaDeAmistades/1.

cadenaDeAmistades(Magos):-
    forall(member(Mago,Magos),esAmistoso(Mago)),
    nth1(Posicion,Mago,Magos),
    nth1(Posicion+1,Mago2,Magos),
    podriaQuedarEn(Mago,Casa),
    podriaQuedarEn(Mago2,Casa).



