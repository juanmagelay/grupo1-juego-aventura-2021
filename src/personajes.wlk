import wollok.game.*
import elementos.*
import nivel_bloques.*
//import direccion.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

class PersonajeSimple {
	var property position = game.at(10,8)
	var property direccion = "arriba"
	const property image = "player.png"	
}

class PersonajeNivel1 inherits PersonajeSimple {
	method moverAArriba() {
		direccion = "arriba"
		self.position(self.position().up(1))
	}
	method moverAAbajo() {
		direccion = "abajo"
		self.position(self.position().down(1))
	}
	method moverADerecha() {
		direccion = "derecha"
		self.position(self.position().right(1))
	}
	method moverAIzquierda() {
		direccion = "izquierda"
		self.position(self.position().left(1))
	}
	method mensaje() { return "Se movió" } 
}
