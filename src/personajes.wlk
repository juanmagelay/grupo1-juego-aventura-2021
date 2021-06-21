import wollok.game.*
import elementos.*
import nivel_bloques.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

class PersonajeSimple {
	var property position = game.at(10,8)
	const property image = "player.png"	
}

class PersonajeNivel1 inherits PersonajeSimple {
	/*method laCajaQueTengoArriba() {
		return nivelBloques.cajas().find( { c => self.posicionDeCajaArribaIgualPersonaje(c) } )
	}
	method posicionDeCajaArribaIgualPersonaje(unaCaja) {
		return 
			unaCaja.position().y() == (self.position().y()) and
			unaCaja.position().x() == (self.position().x())
	}	
	method moverAArriba() {
		if ( nivelBloques.cajas().any( { c => self.posicionDeCajaArribaIgualPersonaje(c) } )) {
			self.position(self.position().up(1))	
			self.laCajaQueTengoArriba().moverAArriba()
		} else {	
			self.position(self.position().up(1))	
		}
	}*/
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
	method mensaje() { return "Se movió" } 
}
