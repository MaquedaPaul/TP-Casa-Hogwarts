%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parte 1 - Sombrero Seleccionador
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

es/2.
caracter/1.
odiaCasa/2.
casa/1.
mago/1.
sombrero/2.
permiteEntrar/2.
tieneCaracterPara/2.
podriaQuedarEn/2.
cadenaDeAmistades/1.

es(_,Mago):-
    mago(Mago).

%Harry
es(corajudo,harry).
es(amistoso,harry).
es(orgulloso,harry).
es(inteligente,harry).
es(mestizo,harry).
odiaCasa(harry,slytherin).

%Draco
es(orgulloso,draco).
es(inteligente,draco).
es(puro,draco).
odiaCasa(draco,hufflepuff).

%Hermione
es(orgulloso,hermione).
es(inteligente,hermione).
es(impuro,hermione).
es(responsable,hermione).

casa(gryffindor).
casa(ravenclaw).
casa(slytherin).
casa(hufflepuff).

mago(harry).
mago(draco).
mago(hermione).



sombrero(gryffindor,Mago):-
    es(corajudo,Mago).

sombrero(slytherin,Mago):-
    es(inteligente,Mago),
    es(orgulloso,Mago).

sombrero(ravenclaw,Mago):-
    es(inteligente,Mago),
    es(responsable,Mago).

sombrero(hufflepuff,Mago):-
    es(amistoso,Mago).

permiteEntrar(Mago,Casa):-
    mago(Mago),
    casa(Casa),
    Casa \= slytherin.

permiteEntrar(Mago,slytherin):-
    not(es(impuro,Mago)).

tieneCaracterPara(Casa,Mago):-
    sombrero(Casa,Mago).

podriaQuedarEn(Mago,Casa):-
    tieneCaracterPara(Casa,Mago),
    permiteEntrar(Mago,Casa),
    not(odiaCasa(Mago,Casa)).

podriaQuedarEn(hermione,gryffindor).

cadenaDeAmistades(Magos):-
    forall(member(Mago,Magos),es(amistoso,Mago)),
    nth1(Posicion,Mago,Magos),
    nth1(Posicion+1,Mago2,Magos),
    podriaQuedarEn(Mago,Casa),
    podriaQuedarEn(Mago2,Casa).



