import wollok.game.*
import utilidades.*

class Bloque {
	var property position
	const property image = "caja.png" 	
	
	// agregar comportamiento	
	method moverHacia(direccion) {
		if ( direccion == "arriba" and (self.position().y() < game.height() -1) ) { 
			self.position(self.position().up(1))
		} else if ( direccion == "abajo" and (self.position().y() > 0) ) { 
			self.position(self.position().down(1))
		} else if ( direccion == "derecha" and (self.position().x() < game.width() - 1) ) { 
			self.position(self.position().right(1))
		} else if ( direccion == "izquierda" and (self.position().x() > 0) ) { 
			self.position(self.position().left(1))
		}
	}
	
	method estaEnElBorde() {
		return
			self.position().y() == 0 or self.position().x() == 0 or 
			self.position().y() == game.height() - 1 or self.position().x() == game.width() - 1
	}
	
	method estaEnDeposito() { return deposito.tienePosicion(self.position()) }
}

object puerta {
	var property position = game.at(14, 0)
	const property image = "puerta.png"
}

object deposito {
	method tienePosicion(unaPosicion) { 
		return unaPosicion.x().between(5,9) and unaPosicion.y().between(7,12)
	}
}

class Llave {
	var property position = utilidadesParaJuego.posicionArbitraria()
	var property image = "llave.png"
}

class Pollo {
	var property energiaQueDa
	var property position = utilidadesParaJuego.posicionArbitraria()
	var property image = "pollo.png"

}

class Modificador {
	var property position = utilidadesParaJuego.posicionArbitraria()
	method energiaQueDa(personaje, pollo)
}

class Duplicador inherits Modificador {
	var property image = "duplicador.png"
	
	override method energiaQueDa(personaje, pollo) = pollo.energiaQueDa() * 2
}

class Reforzador inherits Modificador {
	var property image = "reforzador.png"
	
	override method energiaQueDa(personaje, pollo) {
		return
			pollo.energiaQueDa() * 2 + 
			if (personaje.energia() < 10) { 20 } else { 0 }
	} 
}

class Triplicador inherits Modificador {
	var property image = "triplicador.png"
	
	 override method energiaQueDa(personaje, pollo) {
	 	return 
			if (personaje.energia().even())
				pollo.energiaQueDa() * 3
			else 0
	}	
}

class CajaSorpresa {
	var property position = utilidadesParaJuego.posicionArbitraria()
	var property image = "sorpresa.png"
	
	method efecto(personaje)
}

class Mas30 inherits CajaSorpresa {
	override method efecto(personaje) {
		if(self.image() == "sorpresa.png") {
		  personaje.energia(personaje.energia() + 30)
		  self.image("sorpresa-abierta.png")
		}	
	}
}

class Menos15 inherits CajaSorpresa {
	override method efecto(personaje) {
		if(self.image() == "sorpresa.png") {
		  personaje.energia(personaje.energia() - 15)
		  self.image("sorpresa-abierta.png")
		}	
	}
}

class AparecePollo inherits CajaSorpresa {
	override method efecto(personaje) {
		if(self.image() == "sorpresa.png") {
		  game.addVisual(new Pollo(energiaQueDa = 5))
		  self.image("sorpresa-abierta.png")
		}	
	}
}

class Teletransporta inherits CajaSorpresa {
	override method efecto(personaje) {
		if(self.image() == "sorpresa.png") {
		  personaje.position(utilidadesParaJuego.posicionArbitraria())
		  self.image("sorpresa-abierta.png")
		}	
	}
}
