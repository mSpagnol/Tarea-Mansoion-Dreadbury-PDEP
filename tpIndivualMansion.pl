viveEnLaMansion(charles).
viveEnLaMansion(agatha).
viveEnLaMansion(mayordomo).

% odia(Odiador, Odiado).
odia(charles, mayordomo).
odia(agatha, charles).
odia(agatha, agatha).
odia(mayordomo, agatha).
odia(mayordomo, charles).

esMasRicoQueAgatha(Persona) :-
    viveEnLaMansion(Persona),
    not(odia(mayordomo, Persona)).

esElAsesinoDeAgatha(Persona) :-
    viveEnLaMansion(Persona),
    odia(Persona, agatha),
    not(esMasRicoQueAgatha(Persona)).

/*
1)  ?- esElAsesinoDeAgatha(Persona).
    Persona = agatha ;
    false.

2 a) ?- odia(_, milhouse).
    false.

     ?- odia(charles, UnaPersona).
    UnaPersona = mayordomo.

    ?- odia(UnaPersona, agatha).
    UnaPersona = agatha ;
    UnaPersona = mayordomo.

    ?- odia(Odiador, Odiado).
    Odiador = charles,
    Odiado = mayordomo ;
    Odiador = agatha,
    Odiado = charles ;
    Odiador = Odiado, Odiado = agatha ;
    Odiador = mayordomo,
    Odiado = agatha ;
    Odiador = mayordomo,
    Odiado = charles.

    ?- odia(mayordomo, _).
    true 
*/


%              Tarea Extra    

% BASE DE CONOCIMIENTOS

%escribio(Autor, Obra) -> hecho (hay 24 claúsulas)
escribio(elsaBornemann, socorro).
escribio(neilGaiman, sandman).
escribio(alanMoore, watchmen).
escribio(brianAzarello, cienBalas).
escribio(warrenEllis, planetary).
escribio(frankMiller, elCaballeroOscuroRegresa).
escribio(frankMiller, batmanAnioUno).
escribio(neilGaiman, americanGods).
escribio(neilGaiman, buenosPresagios).
escribio(terryPratchett, buenosPresagios).
escribio(isaacAsimov, fundacion).
escribio(isaacAsimov, yoRobot).
escribio(isaacAsimov, elFinDeLaEternidad).
escribio(isaacAsimov, laBusquedaDeLosElementos).
escribio(joseHernandez, martinFierro).
escribio(stephenKing, it).
escribio(stephenKing, misery).
escribio(stephenKing, carrie).
escribio(stephenKing, elJuegoDeGerald).
escribio(julioCortazar, rayuela).
escribio(jorgeLuisBorges, ficciones).
escribio(jorgeLuisBorges, elAleph).
escribio(horacioQuiroga, cuentosDeLaSelva).
escribio(horacioQuiroga, cuentosDeLocuraAmorYMuerte).

% Agregamos qué obras son cómics.

esComic(sandman).
esComic(cienBalas).
esComic(watchmen).
esComic(planetary).
esComic(elCaballeroOscuroRegresa).
esComic(batmanAnioUno).


esArtistaDelNovenoArte(Artista) :-
    escribio(Artista, Obra),
    esComic(Obra).

esArtistaDelNovenoArte(artSpiegelman). 

% copiasVendidas(Obra,Cantidad)
copiasVendidas(socorro, 10000).
copiasVendidas(sandman, 20000).
copiasVendidas(watchmen, 30000).
copiasVendidas(cienBalas, 40000).
copiasVendidas(planetary, 50000).
copiasVendidas(elCaballeroOscuroRegresa, 60000).
copiasVendidas(batmanAnioUno, 70000).
copiasVendidas(americanGods, 80000).
copiasVendidas(buenosPresagios, 90000).
copiasVendidas(buenosPresagios, 10000).
copiasVendidas(fundacion, 20000).
copiasVendidas(yoRobot, 30000).
copiasVendidas(elFinDeLaEternidad, 30000).
copiasVendidas(laBusquedaDeLosElementos, 40000).
copiasVendidas(martinFierro, 50000).
copiasVendidas(it, 60000).
copiasVendidas(it, 70000).
copiasVendidas(misery, 70000).
copiasVendidas(carrie, 80000).
copiasVendidas(elJuegoDeGerald, 90000).
copiasVendidas(rayuela, 10000).
copiasVendidas(ficciones, 20000).
copiasVendidas(elAleph, 30000).
copiasVendidas(cuentosDeLaSelva, 40000).
copiasVendidas(cuentosDeLocuraAmorYMuerte, 50000).

esArtista(jorgeLuisBorges,argentino).
esArtista(horacioQuiroga, uruguayo).
esArtista(julioCortazar, argentino).
esArtista(joseHernandez, argentino).

% Una obra es un bestseller si vendió más de 50mil copias.

esBestSeller(Obra) :-
    copiasVendidas(Obra, Cantidad),
    Cantidad > 50000.

% Un artista es reincidente si escribió al menos 2 obras.

esReincidente(Artista) :-
    escribio(Artista, UnaObra),
    escribio(Artista, OtraObra),
    UnaObra \=  OtraObra.

esLibro(Obra) :-
    esObra(Obra), % generador para que esLibro sea inversible
    not(esComic(Obra)).

esObra(Obra) :-
    escribio(_, Obra).

leGustaAGusLaObra(Obra):-
    escribio(isaacAsimov, Obra).

leGustaAGusLaObra(sandman).

convieneContratarAlArtista(Artista):-
    escribio(Artista, Obra),
    esBestSeller(Obra).

convieneContratarAlArtista(Artista):-
    esReincidente(Artista).
    
esObraRioPlatense(Obra):-
    esObra(Obra),
    escribio(Artista, Obra),
    esArtista(Artista, Nacionalidad),
    esPlatense(Nacionalidad).


esPlatense(argentino).

esPlatense(uruguayo).
