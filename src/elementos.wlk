import wollok.game.*

class Bloque {
	var property position
	const property image = "caja.png" 	
	
	// agregar comportamiento	
	method moverAArriba() {
		self.position(self.position().up(1))
	}
}

