import wollok.game.*
import elementos.*
import nivel_bloques.*
import utilidades.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

class PersonajeSimple {
	var property position = game.at(10,8)
	var property direccion = "arriba"
	const property image = "player.png"	
	
	method moverAArriba() {
		self.position(self.position().up(1))
	}
	method moverAAbajo() {
		self.position(self.position().down(1))
	}
	method moverADerecha() {
		self.position(self.position().right(1))
	}
	method moverAIzquierda() {
		self.position(self.position().left(1))
	}
}

class PersonajeNivel1 inherits PersonajeSimple {
	
	override method moverAArriba() {
		if (posicionesDisponibles.arriba(self)) {
			super()
			direccion = "arriba"
		}
	}
	
	override method moverAAbajo() {
		if (posicionesDisponibles.abajo(self)) {
			super()
			direccion = "abajo"
		}
	}
	
	override method moverADerecha() {
		if (posicionesDisponibles.derecha(self)) {
			super()
			direccion = "derecha"
		}
	}
	
	override method moverAIzquierda() {
		if (posicionesDisponibles.izquierda(self)) {
			super()
			direccion = "izquierda"
		}
	} 
}

class PersonajeNivel2 inherits PersonajeSimple {
	var property llaves = []
	var property energia = 40
	
	method moverAArriba() {
		self.position(self.position().up(1))
		energia -= 1
	}
	method moverAAbajo() {
		self.position(self.position().down(1))
		energia -= 1
	}
	method moverADerecha() {
		self.position(self.position().right(1))
		energia -= 1
	}
	method moverAIzquierda() {
		self.position(self.position().left(1))
		energia -= 1
	}
	method agregarLlave(unaLlave) {llaves.add(unaLlave)}
	method comer(unPollo) {energia += unPollo.energiaQueDa()}
}
