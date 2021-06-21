import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel_llaves.*


object nivelBloques {
	var caja1 = new Bloque(position=game.at(3,12))
	var caja2 = new Bloque(position=game.at(4,8))
	const property cajas = [caja1, caja2]
	
	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="fondoCompleto.png"))
				 
		// otros visuals, p.ej. bloques o llaves
		game.addVisual(caja1)
		game.addVisual(caja2)
			
		// personaje, es importante que sea el último visual que se agregue
		var personaje = new PersonajeNivel1()
		game.addVisual(personaje)
		keyboard.up().onPressDo{personaje.moverAArriba()}
		keyboard.up().onPressDo{personaje.laCajaQueTengoArriba().moverAArriba()}
		keyboard.down().onPressDo{personaje.moverAAbajo()}
		keyboard.right().onPressDo{personaje.moverADerecha()}
		keyboard.left().onPressDo{personaje.moverAIzquierda()}
		
		//colision
		game.whenCollideDo(personaje, { c => c.moverAArriba() } )
		
		// este es para probar, no es necesario dejarlo
		keyboard.n().onPressDo({ self.terminar() })


		// en este no hacen falta colisiones
	}
	
	method terminar() {
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondoCompleto.png"))
		game.addVisual(new PersonajeNivel1())
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="finNivel1.png"))
			// después de un ratito ...
			game.schedule(3000, {
				// ... limpio todo de nuevo
				game.clear()
				// y arranco el siguiente nivel
				nivelLlaves.configurate()
			})
		})
	}
		
}

