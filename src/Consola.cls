"Filed out from Dolphin Smalltalk"!

Object subclass: #Consola
	instanceVariableNames: 'nombre juegos capacidad'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

Consola guid: (GUID fromString: '{ea2b0ae0-3695-4f7d-81cd-21b39b4233a0}')!

Consola comment: ''!

!Consola categoriesForClass!Kernel-Objects! !

!Consola methodsFor!

agregarJuego:jue
"Agrega un nuevo juego jue a la Consola"
juegos add:jue.!

eliminarJuego:unJuego 
"Elimina un juego de la Consola"
juegos remove:unJuego ifAbsent: [].!

esVacia
"Valida si hay juegos en la consola"
^juegos isEmpty.!

initConsola:unNom capacidad:cap
"Inicializa la clase Consola"
nombre:=unNom.
capacidad:=cap. 
juegos := OrderedCollection new.!

modCapacidad:unaCap
"Modifica la capacidad total de almacenamiento"
capacidad:=unaCap.!

modNombre:unNom
"Modifica el nombre de la consola por unNom"
nombre:=unNom.!

verCapacidad
^capacidad.!

verJuegos
^juegos.

!

verNombre
^nombre.! !

!Consola categoriesForMethods!
agregarJuego:!public! !
esVacia!public! !
initConsola:capacidad:!public! !
modCapacidad:!public! !
modNombre:!public! !
verCapacidad!public! !
verJuegos!public! !
verNombre!public! !
!

!Consola class methodsFor!

crearConsola: unNom capacidad: cap
"Crea la clase consola"
^(self new) initConsola:unNom capacidad:cap.! !

!Consola class categoriesForMethods!
crearConsola:capacidad:!public! !
!

