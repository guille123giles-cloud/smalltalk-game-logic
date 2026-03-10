"Filed out from Dolphin Smalltalk"!

Juego subclass: #MultiPlayer
	instanceVariableNames: 'maxJugadores online'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

MultiPlayer guid: (GUID fromString: '{a682f24f-3315-411e-b686-af05c6d62068}')!

MultiPlayer comment: ''!

!MultiPlayer categoriesForClass!Kernel-Objects! !

!MultiPlayer methodsFor!

initMP:unNom con:conR con:gen con:identificador con:pes con:plat  con:unJuga con:esOnline 
super initJuego:unNom con:conR con:gen con:identificador con:pes con:plat .
maxJugadores:= unJuga.
online:= esOnline.
!

modMaxJ:unMax
"Modifica el maximo de jugadores por unMax"
maxJugadores:=unMax.!

modOnline:esOnline
"mofica el tipo de red del juego"
online:=esOnline.!

verMaxJ
"Retorna el maximo de jugadores"
^maxJugadores.!

verOnline
^online .! !

!MultiPlayer categoriesForMethods!
initMP:con:con:con:con:con:con:con:!public! !
modMaxJ:!public! !
modOnline:!public! !
verMaxJ!public! !
verOnline!public! !
!

!MultiPlayer class methodsFor!

crearMP:unNom con:conR con:gen con:identificador con:pes con:plat  con:unJuga con:esOnline
""
^(super new) initMP:unNom con:conR con:gen con:identificador con:pes con:plat  con:unJuga con:esOnline.! !

!MultiPlayer class categoriesForMethods!
crearMP:con:con:con:con:con:con:con:!public! !
!

