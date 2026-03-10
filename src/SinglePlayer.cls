"Filed out from Dolphin Smalltalk"!

Juego subclass: #SinglePlayer
	instanceVariableNames: 'duracionC'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SinglePlayer guid: (GUID fromString: '{b153a083-b6ad-45e1-b84e-01075f12a64b}')!

SinglePlayer comment: ''!

!SinglePlayer categoriesForClass!Kernel-Objects! !

!SinglePlayer methodsFor!

initSP:unNom con:conR con:gen con:identificador con:pes  con:plat con:unaDura
super initJuego:unNom con:conR con:gen con:identificador con:pes con:plat .
duracionC:=unaDura.
!

modDuracionC:unaDuracion
"Modifica la duracion de una campaña por unaDuracion"
duracionC:=unaDuracion !

verDuracionC
^duracionC.! !

!SinglePlayer categoriesForMethods!
initSP:con:con:con:con:con:con:!public! !
modDuracionC:!public! !
verDuracionC!public! !
!

!SinglePlayer class methodsFor!

crearSP: nom con: conR con: gen con: identificador con: pes con: plat con: duraC
    ^(super new) initSP:nom con:conR con:gen con:identificador con:pes  con:plat con:duraC .! !

!SinglePlayer class categoriesForMethods!
crearSP:con:con:con:con:con:con:!public! !
!

