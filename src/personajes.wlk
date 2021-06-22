import wollok.game.*
import elementos.*
import nivel_bloques.*
import direcciones.*

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
		var posicionSiguiente = game.at(self.position().x(),(game.height() - 1))
		if (self.position().y() < game.height() - 2) {
			self.position(self.position().up(1))
			direccion = "arriba"
		} else if ( self.position().y() < (game.height() - 1)  and game.getObjectsIn(posicionSiguiente).isEmpty() ) {
			self.position(self.position().up(1))
			direccion = "arriba"
		}
	}
	
	method moverAAbajo() {
		var posicionSiguiente = game.at(self.position().x(),0)
		if (self.position().y() > 1) {
			self.position(self.position().down(1))
			direccion = "abajo"
		} else if ( (self.position().y() == 1)  and game.getObjectsIn(posicionSiguiente).isEmpty() ) {
			self.position(self.position().down(1))
			direccion = "abajo"
		}
	}
	
	method moverADerecha() {
		var posicionSiguiente = game.at(( game.width() -1),self.position().y())
		if (self.position().x() < game.width() - 2) {
			self.position(self.position().right(1))
			direccion = "derecha"
		} else if ( (self.position().x() < game.width() -1)  and game.getObjectsIn(posicionSiguiente).isEmpty() ) {
			self.position(self.position().right(1))
			direccion = "derecha"
		}
	}
	
	method moverAIzquierda() {
		var posicionSiguiente = game.at(0, self.position().y())
		if (self.position().x() > 1) {
			self.position(self.position().left(1))
			direccion = "izquierda"
		} else if ( (self.position().x() == 1)  and game.getObjectsIn(posicionSiguiente).isEmpty() ) {
			self.position(self.position().left(1))
			direccion = "izquierda"
		}
	} 
	
}
