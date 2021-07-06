import wollok.game.*
import elementos.*

object utilidadesParaJuego {
	method posicionArbitraria() {
		return game.at(
			0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)
		)
	}
}

object lugarNivel1 {
	method arriba(unPersonaje) {
		return (unPersonaje.position().y() < game.height() - 2) 
	}
	method abajo(unPersonaje) {
		return unPersonaje.position().y() > 1
	}
	method izquierda(unPersonaje) {
		return unPersonaje.position().x() > 1
	}
	method derecha(unPersonaje) {
		return unPersonaje.position().x() < game.width() - 2
	}
}

object lugarNivel2 {
	method arriba(unPersonaje) {
		return unPersonaje.position().y() < game.height() - 1
	}
	method abajo(unPersonaje) {
		return unPersonaje.position().y() > 0
	}
	method izquierda(unPersonaje) {
		return unPersonaje.position().x() > 0
	}
	method derecha(unPersonaje) {
		return unPersonaje.position().x() < game.width() - 1
	}
}

object lugarVacioEnElBorde {
	method arriba(unPersonaje) {
		const posicionSiguiente = game.at(unPersonaje.position().x(),(game.height() - 1))
		return 
			(unPersonaje.position().y() == game.height() - 2 ) and game.getObjectsIn(posicionSiguiente).isEmpty()
	}
	method abajo(unPersonaje) {
		const posicionSiguiente = game.at(unPersonaje.position().x(),0)
		return
			unPersonaje.position().y() == 1 and (game.getObjectsIn(posicionSiguiente).isEmpty() or posicionSiguiente == puerta.position())
	}
	method derecha(unPersonaje) {
		const posicionSiguiente = game.at(( game.width() -1),unPersonaje.position().y())
		return 
			unPersonaje.position().x() == game.width() - 2 and (game.getObjectsIn(posicionSiguiente).isEmpty() or posicionSiguiente == puerta.position())
	}
	method izquierda(unPersonaje) {
		const posicionSiguiente = game.at(0, unPersonaje.position().y() - 1)
		return 
			unPersonaje.position().x() == 1 and game.getObjectsIn(posicionSiguiente).isEmpty()
	}
}

