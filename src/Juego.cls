"Filed out from Dolphin Smalltalk"!

Object subclass: #Juego
	instanceVariableNames: 'titulo consumoRam genero id peso plataforma'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

Juego guid: (GUID fromString: '{305e6a99-7eb9-49ca-8bfd-427cf0f74997}')!

Juego comment: ''!

!Juego categoriesForClass!Kernel-Objects! !

!Juego methodsFor!

compatibleCon:unaPlat
"Valida si el juego es compatible con la plataforma unaPlat"
plataforma includes:unaPlat .!

initJuego:unNom con:conR con:gen con:identificador con:pes con:plat
"Inicializa la clase juego"
titulo:=unNom.
consumoRam:=conR.
genero:=gen.
id:=identificador .
peso:=pes.
plataforma:=plat.
!

modConsumoRam:unCon
"Modifica el consumo de ram de un juego por unCon"
consumoRam:=unCon.
!

modGenero:unGen
"Modifica el genero de un juego por unGen"
genero:=unGen.!

modId:unId
"Modifica el id de un juego por unId"
id :=unId .!

modPeso:unPeso
"Modifica el peso de un juego por unPeso"
peso:=unPeso.!

modPlataforma: nuevaPlataforma
 plataforma:=nuevaPlataforma .
!

modTitulo: unTit
"Modificael titulo de un juego por unTit"
titulo:=unTit.
!

verConsumoRam
"retorna el consumo de ram del juego"
^consumoRam .
!

verGenero
"retorna elgenero del juego"
^genero .
!

verId
"retorna el id del juego"
^id.
!

verPeso
"retorna el peso del juego"
^peso .
!

verPlataforma
"retorna la plataforma del juego"
^plataforma .
!

verTitulo
"Retornael titulo del juego"
^titulo .
! !

!Juego categoriesForMethods!
compatibleCon:!public! !
initJuego:con:con:con:con:con:!public! !
modConsumoRam:!public! !
modGenero:!public! !
modId:!public! !
modPeso:!public! !
modPlataforma:!public! !
modTitulo:!public! !
verConsumoRam!public! !
verGenero!public! !
verId!public! !
verPeso!public! !
verPlataforma!public! !
verTitulo!public! !
!

!Juego class methodsFor!

crearJuego:unNom consumoRam:unConsumo  genero:unGenero id:unId  peso:unPeso  plataforma:unaPlataforma 
"Crea un juego"
^(super new) initJuego: unNom con: unConsumo con: unGenero con: unId con: unPeso con: unaPlataforma.
! !

!Juego class categoriesForMethods!
crearJuego:consumoRam:genero:id:peso:plataforma:!public! !
!

