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

class Duplicador {
	var property position = utilidadesParaJuego.posicionArbitraria()
	var property image = "duplicador.png"
	
	method energiaQueDa(personaje, pollo) = pollo.energiaQueDa() * 2
	
}

class Reforzador{
	var property position = utilidadesParaJuego.posicionArbitraria()
	var property image = "reforzador.png"
	
	method energiaQueDa(personaje, pollo) {
		return
			if (personaje.energia() < 10)
				pollo.energiaQueDa() * 2 + 20
			else pollo.energiaQueDa() * 2
	} 
	
}

class Triplicador {
	var property position = utilidadesParaJuego.posicionArbitraria()
	var property image = "triplicador.png"
	
	 method energiaQueDa(personaje, pollo) {
	 	return 
			if (personaje.energia().even())
				pollo.energiaQueDa() * 3
			else 0
	}	
}