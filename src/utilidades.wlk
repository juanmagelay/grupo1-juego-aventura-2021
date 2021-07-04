import wollok.game.*
import elementos.*

object utilidadesParaJuego {
	method posicionArbitraria() {
		return game.at(
			0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)
		)
	}
}
object posicionesDisponibles {
	method arriba(unPersonaje) {
		var posicionSiguiente = game.at(unPersonaje.position().x(),(game.height() - 1))
		return 
			(unPersonaje.position().y() < game.height() - 2) or
			(unPersonaje.position().y() < (game.height() - 1) and game.getObjectsIn(posicionSiguiente).isEmpty() ) 
	}
	method abajo(unPersonaje) {
		var posicionSiguiente = game.at(unPersonaje.position().x(),0)
		return
			(unPersonaje.position().y() > 1) or
			((unPersonaje.position().y() == 1) and (game.getObjectsIn(posicionSiguiente).isEmpty() or posicionSiguiente == puerta.position()))
	}
	method derecha(unPersonaje) {
		var posicionSiguiente = game.at(( game.width() -1),unPersonaje.position().y())
		return
			(unPersonaje.position().x() < game.width() - 2) or
			((unPersonaje.position().x() < game.width() -1)  and (game.getObjectsIn(posicionSiguiente).isEmpty() or posicionSiguiente == puerta.position()) )
	}
	method izquierda(unPersonaje) {
		var posicionSiguiente = game.at(0, unPersonaje.position().y())
		return 
			(unPersonaje.position().x() > 1) or
			((unPersonaje.position().x() == 1)  and game.getObjectsIn(posicionSiguiente).isEmpty())
	}
}

