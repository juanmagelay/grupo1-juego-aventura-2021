import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel_llaves.*
import utilidades.*

object nivelBloques {
    const caja1 = new Bloque(position=game.at(3,12))
    const caja2 = new Bloque(position=game.at(4,8))
    const caja3 = new Bloque(position=game.at(7,2))
    const caja4 = new Bloque(position=game.at(10,9))
    const caja5 = new Bloque(position=game.at(11,5))
    const property cajas = [caja1, caja2, caja3, caja4, caja5]
    
    method nivelCompleto() = self.cajas().all( { b => b.estaEnDeposito() } )
    
    method configurate() {
        // fondo - es importante que sea el primer visual que se agregue
        game.addVisual(new Fondo(image="fondoCompleto.png"))
                 
        // otros visuals, p.ej. bloques o llaves
        game.addVisual(caja1)
        game.addVisual(caja2)
        game.addVisual(caja3)
        game.addVisual(caja4)
        game.addVisual(caja5)
        
        //salida
        
        game.addVisual(puerta)
            
        // personaje, es importante que sea el último visual que se agregue
        const personaje = new PersonajeNivel1()
        game.addVisual(personaje)
        
        //colision
        game.whenCollideDo(personaje, { c => if(cajas.contains(c)) { c.moverHacia(personaje.direccion()) } } )
		game.whenCollideDo(caja1, { c => if(cajas.contains(c)) { caja1.moverHacia(personaje.direccion()) } } )
		game.whenCollideDo(caja2, { c => if(cajas.contains(c)) { caja2.moverHacia(personaje.direccion()) } } )
		game.whenCollideDo(caja3, { c => if(cajas.contains(c)) { caja3.moverHacia(personaje.direccion()) } } )
		game.whenCollideDo(caja4, { c => if(cajas.contains(c)) { caja4.moverHacia(personaje.direccion()) } } )
		game.whenCollideDo(caja5, { c => if(cajas.contains(c)) { caja5.moverHacia(personaje.direccion()) } } )
		
        //teclado
        keyboard.up().onPressDo{personaje.moverAArriba()}
        keyboard.down().onPressDo{personaje.moverAAbajo()}
        keyboard.right().onPressDo{personaje.moverADerecha()}
        keyboard.left().onPressDo{personaje.moverAIzquierda()}
        keyboard.n().onPressDo({ 
            if(self.nivelCompleto() and personaje.position() == puerta.position()) {
                self.terminar()    
            }
        })
    }
    method terminar() {
        // game.clear() limpia visuals, teclado, colisiones y acciones
        game.clear()
        // después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
        game.addVisual(new Fondo(image="fondoCompleto.png"))
        game.addVisual(new PersonajeNivel1())
        // después de un ratito ...
        game.schedule(2500, {
            game.clear()
            // cambio de fondo
            game.addVisual(new Fondo(image="finNivel1.png"))
            // después de un ratito ...
            game.schedule(3000, {
                // ... limpio todo de nuevo
                game.clear()
                // y arranco el siguiente nivel
                nivelLlaves.configurate()
            })
        })
    }
        
}