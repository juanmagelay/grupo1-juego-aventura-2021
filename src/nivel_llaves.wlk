import wollok.game.*
import fondo.*
import personajes.*
import utilidades.*
import elementos.*

object nivelLlaves {

	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="fondoCompleto.png"))
		 
		// otros visuals, p.ej. bloques o llaves
		const llave1 = new Llave()
		const llave2 = new Llave()
		const llave3 = new Llave()
		game.addVisual(llave1)
		game.addVisual(llave2)
		game.addVisual(llave3)
		
		const pollo1 = new Pollo(energiaQueDa = 10)
		const pollo2 = new Pollo(energiaQueDa = 10)
		const pollo3 = new Pollo(energiaQueDa = 5)
		const pollo4 = new Pollo(energiaQueDa = 5)
		const pollo5 = new Pollo(energiaQueDa = 5)
		game.addVisual(pollo1)
		game.addVisual(pollo2)
		game.addVisual(pollo3)
		game.addVisual(pollo4)
		game.addVisual(pollo5)
		
		const duplicador1 = new Duplicador()
		const duplicador2 = new Duplicador()
		game.addVisual(duplicador1)
		game.addVisual(duplicador2)
		
		const reforzador1 = new Reforzador()
		const reforzador2 = new Reforzador()
		game.addVisual(reforzador1)
		game.addVisual(reforzador2)
		
		const triplicador1 = new Triplicador()
		game.addVisual(triplicador1)
		
		const llaves = [llave1, llave2, llave3]
		const pollos = [pollo1, pollo2, pollo3, pollo4, pollo5]
		const modificadores = [duplicador1, duplicador2, reforzador1, reforzador2, triplicador1]
		
		const sorpresa1 = new Mas30()
		const sorpresa2 = new Menos15()
		const sorpresa3 = new AparecePollo()
		const sorpresa4 = new Teletransporta()
		game.addVisual(sorpresa1)
		game.addVisual(sorpresa2)
		game.addVisual(sorpresa3)
		game.addVisual(sorpresa4)
				
		const sorpresas = [sorpresa1, sorpresa2, sorpresa3, sorpresa4]	
		
		// personaje, es importante que sea el último visual que se agregue
		const personaje = new PersonajeNivel2()
		game.addVisual(personaje)
		
		// teclado
		// este es para probar, no es necesario dejarlo
		keyboard.up().onPressDo{if (personaje.energia() == 0) self.perder() else personaje.moverAArriba()}
		keyboard.down().onPressDo{if (personaje.energia() == 0) self.perder() else personaje.moverAAbajo()}
		keyboard.right().onPressDo{if (personaje.energia() == 0) self.perder() else personaje.moverADerecha()}
		keyboard.left().onPressDo{if (personaje.energia() == 0) self.perder() else personaje.moverAIzquierda()}
		
		keyboard.p().onPressDo{game.say(personaje, "Mi energía es: " + personaje.energia())}
	
		// colisiones, acá sí hacen falta
		game.whenCollideDo(personaje, 
			{ l => 
				if(llaves.contains(l)) {
					personaje.agregarLlave(l) 
					game.removeVisual(l)
					if (personaje.llaves().size() == 3) {game.addVisual(puerta)}
				}
				else if(modificadores.contains(l)) {
					personaje.agregarModificador(l)
					game.removeVisual(l)
				}
				else if (pollos.contains(l)) {
					personaje.comer(l)
					game.removeVisual(l)
				}
				else self.ganar()
			}
		)
	}
	
	method ganar() {
		// es muy parecido al terminar() de nivelBloques
		// el perder() también va a ser parecido
		
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondoCompleto.png"))
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="ganamos.png"))
			// después de un ratito ...
			game.schedule(3000, {
				// fin del juego
				game.stop()
			})
		})
	}
	
	method perder() {	
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondoCompleto.png"))
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="perdiste.png"))
			// después de un ratito ...
			game.schedule(3000, {
				// fin del juego
				game.stop()
			})
		})
	}
}
