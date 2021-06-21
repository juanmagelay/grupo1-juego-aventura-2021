import wollok.game.*

class Bloque {
	var property position
	const property image = "caja.png" 	
	
	// agregar comportamiento	
	method moverHacia(direccion) {
		if ( direccion == "arriba" and (self.position().y() < game.height() -1) ) { 
			self.position(self.position().up(1))
		} else if ( direccion == "abajo" and (self.position().y() > 0) ) { 
			self.position(self.position().down(1))
		} else if ( direccion == "derecha" and (self.position().x() < game.width() -1) ) { 
			self.position(self.position().right(1))
		} else if ( direccion == "izquierda" and (self.position().x() > 0) ) { 
			self.position(self.position().left(1))
		} //getObjectsIn(position)
	}
}