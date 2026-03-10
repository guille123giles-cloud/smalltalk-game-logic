|consola identificador nombre tipo titulo gen plataforma tamJuego consuR numPlataformas mem juegos col colGen sinRep dic id almacenamiento op repetir sumatoria espacioRestante nom consRam pes plat maxJug esOnline juego duraC idMod juego_mod control otroId buscarID recuperado opcion nueTit nueGen nuePeso pesoAnt nuePlat nueConsRam nueDurac nueMax idBusqueda juego_encontrado p platFiltrada acu col_multi |
id := 1.

nombre := Prompter prompt: '¿Que nombre tendra la consola?' caption: 'Consola de Juegos'.

mem := (Prompter prompt: 'Ingrese la cantidad de memoria de la consola (en MB)' caption: 'Consola de Juegos') asNumber.

[mem > 0] whileFalse: [
    MessageBox errorMsg: 'Error: Ingrese un numero entero positivo' caption: 'Consola de Juegos'.
    mem := (Prompter prompt: 'Ingrese la cantidad de memoria de la consola (en MB)' caption: 'Consola de Juegos') asNumber.
].

consola := Consola crearConsola: nombre capacidad: mem.
identificador := 1.
almacenamiento := consola verCapacidad.
op := 1.

[op ~= 0] whileTrue: [
	
	Transcript show: '--- MENU ---
1- CARGAR JUEGO.
2- LISTAR JUEGOS.
3- MODIFICAR JUEGO POR ID.
4- ELIMINAR JUEGO POR ID.
5- LISTAR JUEGOS SEGUN PLATAFORMA.
6- CONSUMO DE RAM PROMEDIO.
7- LISTAR JUEGOS OFFLINE.
8- VER JUEGOS POR GENERO.
9-VER DATOS DE LA CONSOLA.
0- SALIR.'; cr; cr.

	op := (Prompter prompt: 'Ingrese una opcion del 1 al 9: ') asNumber.

	(op between: 0 and: 9)
		ifTrue: [
				
				Transcript show: 'Se selecciono la opción ', op printString; cr.
				(op = 0) ifTrue: [Transcript show: 'Gracias por utilizar el programa!'; cr].
			(op = 1) ifTrue: [
				repetir := true.
				[repetir] whileTrue: [
					
					sumatoria := 0.
					consola verJuegos do: [ :aux | sumatoria := sumatoria + (aux verPeso) ].
					espacioRestante := almacenamiento - sumatoria.
					
					(espacioRestante = 0) ifTrue: [
						Transcript show: 'El almacenamiento de la consola esta lleno'; cr.
						repetir := false. 
					] ifFalse: [

						nom := Prompter prompt: 'Ingrese el titulo del juego'.
						tipo := ChoicePrompter choices: #('SinglePlayer' 'MultiPlayer') caption: 'Tipo de Juego'.
						consRam := (Prompter prompt: 'Ingrese el consumo de RAM del juego en MB') asNumber.
						gen :=ChoicePrompter choices: #('Accion' 'Aventura' 'Moba' 'Shooter' 'Estrategia' 'Deportes' 'Pelea' 'Carreras') caption: 'Genero'.

						pes := (Prompter prompt: 'Ingrese el peso del juego en MB') asNumber.
						
					
						sumatoria := sumatoria + pes.
						
						(almacenamiento >= sumatoria) ifTrue: [
							plat := ChoicePrompter choices: #('PlayStation' 'Xbox' 'Nintendo Switch' 'PSP') caption: 'Plataforma'.
							
							(tipo = 'MultiPlayer') ifTrue: [
								maxJug := (Prompter prompt: 'Ingrese el maximo de jugadores') asNumber.
								esOnline := MessageBox confirm: '¿Es online?'.
								juego := MultiPlayer crearMP: nom con: consRam con: gen con: identificador con: pes con: plat con: maxJug con: esOnline.
							].
							
							(tipo = 'SinglePlayer' ) ifTrue: [
								duraC := (Prompter prompt: 'Ingrese la duracion de la campaña en horas') asNumber.
								juego := SinglePlayer crearSP: nom con: consRam con: gen con: identificador con: pes con: plat con: duraC.
							].
							
							consola agregarJuego: juego.
							identificador := identificador + 1.
						] ifFalse: [
							MessageBox errorMsg: 'El juego es demasiado grande'.
						].
						
						repetir := MessageBox confirm: '¿Desea agregar otro juego?'.
					].
				].
			].

			(op = 2) ifTrue: [
				(consola esVacia) ifTrue: [
				Transcript show: 'No hay juegos cargados en la consola.'; cr.
				] ifFalse: [
					col := consola verJuegos.
					col do: [:jue | 
						Transcript show: '--------------------------'; cr.
						Transcript show: 'ID: ', jue verId printString; cr.
						Transcript show: 'Plataforma: ', jue verPlataforma printString; cr.
						Transcript show: 'Consumo RAM: ', (jue verConsumoRam printString), ' MB'; cr.
						Transcript show: 'Titulo: ', jue verTitulo printString; cr.
						Transcript show: 'Genero: ', jue verGenero printString; cr.
						Transcript show: 'Peso: ', (jue verPeso printString) , ' MB' ; cr.
			
						(jue isKindOf: SinglePlayer) ifTrue: [
							Transcript show: 'Duracion campaña: ', jue verDuracionC printString; cr.
						].
						(jue isKindOf: MultiPlayer) ifTrue: [
							Transcript show: 'Max jugadores: ', jue verMaxJ printString; cr.
							Transcript show: 'Online: ', jue verOnline printString; cr.
						].
						Transcript show: '--------------------------'; cr.
					].
				].
			].

(op = 3) ifTrue: [
		    (consola esVacia) ifTrue: [
			Transcript show: 'No hay juegos cargados en la consola.';
			cr.
		    ] ifFalse: [
			idMod := (Prompter prompt: 'Ingrese el ID del juego a modificar') asNumber.
			col := consola verJuegos.
			juego_mod := col detect: [:jue | jue verId = idMod] ifNone: [nil].
			(juego_mod notNil) ifTrue: [
			
			opcion := ChoicePrompter choices: #(
				'Modificar ID' 
				'Modificar Titulo' 
				'Modificar Genero' 
				'Modificar Peso' 
				'Modificar Plataforma' 
				'Modificar Consumo de RAM' 
				'Modificar Duracion de Campania (Solo para SinglePlayer)'
				'Modificar Maximo de Jugadores y Estado Online (Solo para MultiPlayer)'
			    ) caption: 'Que desea modificar?'.
			
			(opcion = 'Modificar ID') ifTrue: [
				control := 0.
				[control = 0] whileTrue: [
					otroId := (Prompter prompt: 'Ingrese el nuevo ID del juego: ') asNumber.
					buscarID := consola verJuegos.
					recuperado := buscarID detect: [:jue | jue verId = otroId] ifNone: [nil].
					(recuperado notNil)
						ifTrue: [MessageBox notify: 'Ya existe un juego con ese ID. Debe ingresar uno diferente']
						ifFalse: [
							control := 1.
							juego_mod modId: otroId.
						].
				].
			].

			(opcion = 'Modificar Titulo') ifTrue: [
				nueTit := Prompter prompt: 'Ingrese el nuevo titulo del juego: '.
				juego_mod modTitulo: nueTit.
			    ].
			(opcion = 'Modificar Genero') ifTrue: [
				nueGen := ChoicePrompter choices: #('Accion' 'Aventura' 'Moba' 'Shooter' 'Estrategia' 'Deportes' 'Pelea' 'Carreras') caption: 'Nuevo Genero'.
				juego_mod modGenero: nueGen.
			    ].

			    (opcion = 'Modificar Peso') ifTrue: [
				nuePeso := (Prompter prompt: 'Ingrese el nuevo peso del juego en MB: ') asNumber.
				sumatoria := 0.
				consola verJuegos do: [:aux | sumatoria := sumatoria + (aux verPeso)].
				pesoAnt := juego_mod verPeso.
				sumatoria := sumatoria + nuePeso - pesoAnt.
				almacenamiento := consola verCapacidad.
				(almacenamiento >= sumatoria) 
				    ifTrue: [juego_mod modPeso: nuePeso]
				    ifFalse: [MessageBox notify: 'No hay suficiente espacio en la consola para el juego.'].
			    ].

			    (opcion = 'Modificar Plataforma') ifTrue: [
				nuePlat := ChoicePrompter choices: #('PlayStation' 'Xbox' 'Nintendo Switch' 'PSP') caption: 'Nueva Plataforma'.
				juego_mod modPlataforma: nuePlat.
			    ].

			    (opcion = 'Modificar Consumo de RAM') ifTrue: [
				nueConsRam := (Prompter prompt: 'Ingrese el nuevo consumo de RAM del juego (en MB): ') asNumber.
				juego_mod modConsumoRam: nueConsRam.
			    ].
			    (opcion = 'Modificar Duracion de Campania (Solo para SinglePlayer)') ifTrue: [
				(juego_mod isKindOf: SinglePlayer) 
				    ifTrue: [
					nueDurac := (Prompter prompt: 'Ingrese la nueva duracion de la campania en horas: ') asNumber.
					juego_mod modDuracionC: nueDurac.
				    ] ifFalse: [
					MessageBox notify: 'Este juego no es de tipo SinglePlayer.'
				    ].
			    ].
			(opcion = 'Modificar Maximo de Jugadores y Estado Online (Solo para MultiPlayer)') ifTrue: [
				(juego_mod isKindOf: MultiPlayer) 
				    ifTrue: [
					nueMax := (Prompter prompt: 'Ingrese el nuevo maximo de jugadores: ') asNumber.
					esOnline := MessageBox confirm: 'Es online?'.
					juego_mod modMaxJ: nueMax.
					juego_mod modOnline: esOnline.
				    ] ifFalse: [
					MessageBox notify: 'Este juego no es de tipo MultiPlayer.'
				    ].
			    ].
			MessageBox notify: 'La modificacion se ha realizado con exito!'.
			] ifFalse: [
			    MessageBox notify: 'No hay ningun juego con ese ID.'
			].
		    ].
		].

		(op = 4) ifTrue: [
					(consola esVacia) ifTrue: [
						Transcript show: 'No hay juegos cargados en la consola.'; cr.
					] ifFalse: [
						idBusqueda := (Prompter prompt: 'Ingrese el ID del Juego a eliminar') asNumber.
						col := consola verJuegos.
						juego_encontrado := col detect: [:cons | cons verId = idBusqueda] ifNone: [nil].

						juego_encontrado ifNil: [
							MessageBox errorMsg: 'Juego no encontrado'.
						] ifNotNil: [
							consola eliminarJuego: juego_encontrado.
							MessageBox notify: 'Juego eliminado exitosamente.'.
						].
			].
		].

		(op = 5) ifTrue: [
			(consola esVacia) ifTrue: [
				Transcript show: 'No hay juegos cargados en la consola.'; cr.
			] ifFalse: [
				col := consola verJuegos.
				p := ChoicePrompter choices: #('PlayStation' 'Xbox' 'Nintendo Switch' 'PSP') caption: 'Plataforma'.
				platFiltrada := col select: [:jue | jue verPlataforma = p].

				platFiltrada isEmpty 
					ifTrue: [Transcript show: 'No hay juegos disponibles para la plataforma ingresada.'; cr.]
					ifFalse: [
						platFiltrada do: [:jue |
							Transcript show: '--------------------------'; cr.
						Transcript show: 'ID: ', jue verId printString; cr.
						Transcript show: 'Consumo RAM: ', (jue verConsumoRam printString ) , 'MB' ; cr.
						Transcript show: 'Titulo: ', jue verTitulo printString; cr.
						Transcript show: 'Genero: ', jue verGenero printString; cr.
						Transcript show: 'Peso: ', (jue verPeso printString) , ' MB' ; cr.
			
						(jue isKindOf: SinglePlayer) ifTrue: [
							Transcript show: 'Duracion campaña: ', jue verDuracionC printString; cr.
						].
						(jue isKindOf: MultiPlayer) ifTrue: [
							Transcript show: 'Max jugadores: ', jue verMaxJ printString; cr.
							Transcript show: 'Online: ', jue verOnline printString; cr.
						].
						Transcript show: '--------------------------'; cr.
						].
					].
			].
		].

	(op = 6) ifTrue: [
		Transcript show: '---------------------------------'; cr.
		(consola esVacia)
			ifTrue: [
				Transcript show: 'No hay juegos cargados en la consola.'; cr.
			] ifFalse: [
				col := consola verJuegos.
				acu := 0.
				col do: [:jue | 
					acu := acu + jue verConsumoRam.
				].
				consRam := acu asFloat / col size.
				Transcript show: 'Consumo de RAM promedio: ', consRam printString, ' MB'; cr.
				Transcript show: '---------------------------------'; cr.
			].
	].

			(op = 7) ifTrue: [
				Transcript show: '--------LISTA JUEGOS OFFLINE------------'; cr.
				(consola esVacia)
					ifTrue: [
						Transcript show: 'No hay juegos cargados en la consola.'; cr.
					] ifFalse: [
						col := consola verJuegos.
						col_multi := col select: [:jue | (jue isKindOf: MultiPlayer) and: [jue verOnline = false]].

						col_multi isEmpty
							ifTrue: [
								Transcript show: 'No hay juegos offline.'; cr.
							] ifFalse: [
								col_multi do: [:jue |
									Transcript show: '--------------------------'; cr.
									Transcript show: 'ID: ', jue verId printString; cr.
									Transcript show: 'Plataforma: ', jue verPlataforma printString; cr.
									Transcript show: 'Peso: ', (jue verConsumoRam printString), ' MB'; cr.
									Transcript show: 'Titulo: ', jue verTitulo printString; cr.
									Transcript show: 'Genero: ', jue verGenero printString; cr.
									Transcript show: 'Peso: ', (jue verPeso printString), ' MB'; cr.
									Transcript show: 'Max Jugadores: ', jue verMaxJ printString; cr.
									Transcript show: '--------------------------'; cr.
								].
							].
					].
			].

			(op = 8) ifTrue: [
			(consola esVacia)
				ifTrue: [
					Transcript show: 'No hay juegos cargados en la consola.'; cr.
				] ifFalse: [
					col := consola verJuegos.
					colGen := col collect: [:elem | elem verGenero].
					sinRep := colGen asSet.
					dic := Dictionary new.
					
					sinRep do: [:elem | 
						dic at: elem put: (colGen occurrencesOf: elem).
					].

					dic keysAndValuesDo: [:elem :cant |
						Transcript show: 'Genero: ', elem; cr.
						Transcript show: 'Cantidad de juegos: ', cant printString; cr; cr.
					].
				
				].
			].

		(op = 9) ifTrue: [
			Transcript show: '------------------------ ' ; cr.
			Transcript show: 'Consola: ', consola verNombre; cr.
			Transcript show: 'Capacidad: ', consola verCapacidad printString, ' MB'; cr.	
			Transcript show: '------------------------ ' ; cr.
		].

	] ifFalse:[ MessageBox errorMsg: 'Opcion no valida! Por favor ingrese otra opcion (0-9).'. 
	].	
].