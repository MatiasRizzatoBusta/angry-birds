class Pajaro { //clase abstracta
	var fuerza
	var ira
		
	method enojarse() = ira *2
	
	method fuerza() = fuerza
	method ira() = ira
	
	method disminuirIra(disminucion){
		ira -= disminucion
	}
	
	method esChuck() = false
	
}

class Comun inherits Pajaro{
	override method fuerza() = ira *2
}

//los siguientes son clases u objetos? solo hay un red? varios pero con las mismas caracteristicas? o varios con distintas?
//en caso de las primeras dos hacer un object en la otra son clases.	

class Red inherits Pajaro{
	var property vecesQueSeEnojo
	
	override method enojarse(){
		vecesQueSeEnojo += 1
		return super()
	}
	
	override method fuerza() = ira * 10 * vecesQueSeEnojo
	
}

class Bomb inherits Pajaro{
	var topeMaximoDeFuerza = 9000
	
	method cambiarTopeMaximoDeFuerza(nuevoTope){
		topeMaximoDeFuerza = nuevoTope
	}
	
	override method fuerza() = topeMaximoDeFuerza.min(ira * 2)
}

class Chuck inherits Pajaro{
	var velocidad
		
	method velocidad() = velocidad
	
	override method fuerza(){
		if(velocidad <= 80){
			return 	150
		}else{
			return 150 + (5 * (velocidad - 80))
		}
	}
	
	override method enojarse() {
		velocidad = velocidad * 2
		return velocidad
		}
		
	override method disminuirIra(disminucion){}
	
	override method esChuck() = true
}

class Terence inherits Red{
	var multiplicador
	
	override method fuerza() = (vecesQueSeEnojo  * multiplicador) + ira
	
	
}

class Matilda inherits Comun{
	var huevos
	
	method sumaFuerzaHuevos() = huevos.sum({huevo => huevo.fuerza()})
	
	override method enojarse(){
		const nuevoHuevo = new Huevo(peso = 2)
		huevos.add(nuevoHuevo)
		return ira
	}
	
	override method fuerza() =  super() + self.sumaFuerzaHuevos()
}

class Huevo{
	var peso
	
	method fuerza() = peso
}