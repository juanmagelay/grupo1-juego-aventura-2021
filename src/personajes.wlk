import wollok.game.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

class PersonajeSimple {
	var property position = game.at(10,8)
	const property image = "player.png"	
}

class PersonajeNivel1 inherits PersonajeSimple {
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
