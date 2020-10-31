import pajaros.*
import eventos.*
import obstaculos.*

class Isla{
	var property pajarosQueLaHabitan 
	
	method agregarPajaro(unPajaro) = pajarosQueLaHabitan.add(unPajaro)
	method sacarUnPajaro(unPajaro) = pajarosQueLaHabitan.remove(unPajaro)
	
	method pajarosFuertes() = pajarosQueLaHabitan.filter({pajaro => pajaro.fuerza() > 50})
	
	method fuerzaIsla() = self.pajarosFuertes().sum({pajaro => pajaro.fuerza()})
	
	method enojarlosATodos(cantidad){
		if(cantidad > 0){
			var nuevaCantidad 
			pajarosQueLaHabitan.forEach({pajaro => pajaro.enojarse()})
			nuevaCantidad = cantidad - 1
			self.enojarlosATodos(nuevaCantidad) //armo un loop
		}
	}

	method sucedeUnEvento(evento){
		evento.aplicarse(self)
	}
	
	method usarUnPajaro(pajaro,isla){
		pajarosQueLaHabitan.remove(pajaro)
		isla.recibirAtaque(pajaro)
	}
	
	method atacarUnaIsla(isla){
		pajarosQueLaHabitan.forEach({pajaro => self.usarUnPajaro(pajaro,isla)})
	}
	
	method recuperaronLosHuevos(isla) = not(isla.tieneObstaculos())
}

class IslaPorcina {
	var property obstaculos
	
	method agregarObstaculo(obstaculo) = obstaculos.add(obstaculo)
	
	method recibirAtaque(pajaro){
		var unObstaculo = obstaculos.head()
		if(unObstaculo.esDestruido(pajaro)){
			obstaculos.remove(unObstaculo)
		}
	}
	
	method tieneObstaculos() = obstaculos.size() > 0
}
