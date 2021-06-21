import wollok.game.*

class Bloque {
	var property position
	const property image = "caja.png" 	
	
	// agregar comportamiento	
	method moverHacia(direccion) {
		if ( direccion == "arriba" ) { self.position(self.position().up(1)) }
		else if ( direccion == "abajo" ) { self.position(self.position().down(1)) }
		else if ( direccion == "derecha" ) { self.position(self.position().right(1)) }
		else { self.position(self.position().left(1)) }
	}
}

