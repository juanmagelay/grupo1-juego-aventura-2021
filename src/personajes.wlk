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
		if (lugarNivel1.arriba(self) or lugarVacioEnElBorde.arriba(self)) {
			super()
			direccion = "arriba"
		}
	}
	override method moverAAbajo() {
		if (lugarNivel1.abajo(self) or lugarVacioEnElBorde.abajo(self)) {
			super()
			direccion = "abajo"
		}
	}
	override method moverADerecha() {
		if (lugarNivel1.derecha(self) or lugarVacioEnElBorde.derecha(self)) {
			super()
			direccion = "derecha"
		}
	}
	override method moverAIzquierda() {
		if (lugarNivel1.izquierda(self) or lugarVacioEnElBorde.izquierda(self)) {
			super()
			direccion = "izquierda"
		}
	} 
}

class PersonajeNivel2 inherits PersonajeSimple {
	var property llaves = []
	var property energia = 40
	var property modificadores = []
	
	override method moverAArriba() {
		if (lugarNivel2.arriba(self) and not hayCajaSorpresa.arriba(self)) {
			super()
			energia -= 1
		} else if (hayCajaSorpresa.arriba(self)) {
			game.getObjectsIn(hayCajaSorpresa.posicionSiguiente()).get(0).efecto(self)
		}
	}
	override method moverAAbajo() {
		if (lugarNivel2.abajo(self) and not hayCajaSorpresa.abajo(self)) {
			super()
			energia -= 1
		} else if (hayCajaSorpresa.abajo(self)) {
			game.getObjectsIn(hayCajaSorpresa.posicionSiguiente()).get(0).efecto(self)
		}
	}
	override method moverADerecha() {
		if (lugarNivel2.derecha(self) and not hayCajaSorpresa.derecha(self)) {
			super()
			energia -= 1
		} else if (hayCajaSorpresa.derecha(self)) {
			game.getObjectsIn(hayCajaSorpresa.posicionSiguiente()).get(0).efecto(self)
		}
	}
	override method moverAIzquierda() {
		if (lugarNivel2.izquierda(self) and not hayCajaSorpresa.izquierda(self)) {
			super()
			energia -= 1
		} else if (hayCajaSorpresa.izquierda(self)) {
			game.getObjectsIn(hayCajaSorpresa.posicionSiguiente()).get(0).efecto(self)
		}
	}
	method agregarLlave(unaLlave) {llaves.add(unaLlave)}
	method agregarModificador(modificador) {
		if (! modificadores.isEmpty()) { modificadores.remove(modificadores.get(0)) }
		modificadores.add(modificador)
	}
	method comer(unPollo) {
		if (not modificadores.isEmpty()) {
			energia += modificadores.get(0).energiaQueDa(self, unPollo)
			modificadores.remove(modificadores.get(0))
		} else energia += unPollo.energiaQueDa()
	}
}
