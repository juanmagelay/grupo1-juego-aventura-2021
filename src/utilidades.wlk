import wollok.game.*
import elementos.*

object utilidadesParaJuego {
	method posicionArbitraria() {
		return game.at(
			0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)
		)
	}
}
object lugar {
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

object lugarVacio {
	method arriba(unPersonaje) {
		var posicionSiguiente = game.at(unPersonaje.position().x(),(game.height() - 1))
		return 
			game.getObjectsIn(posicionSiguiente).isEmpty()
	}
	method abajo(unPersonaje) {
		var posicionSiguiente = game.at(unPersonaje.position().x(),0)
		return
			game.getObjectsIn(posicionSiguiente).isEmpty() or posicionSiguiente == puerta.position()
	}
	method derecha(unPersonaje) {
		var posicionSiguiente = game.at(( game.width() -1),unPersonaje.position().y())
		return game.getObjectsIn(posicionSiguiente).isEmpty() or posicionSiguiente == puerta.position()
	}
	method izquierda(unPersonaje) {
		var posicionSiguiente = game.at(0, unPersonaje.position().y())
		return game.getObjectsIn(posicionSiguiente).isEmpty()
	}
}

