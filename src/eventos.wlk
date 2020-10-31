import islas.*

class Evento{
	method aplicarse(isla)
}


class SesionDeManejoDeIra inherits Evento {
	
	method todosMenosChuck(isla) = isla.pajarosQueLaHabitan().filter({pajaro => not(pajaro.esChuck())})
	
	override method aplicarse(isla){
		self.todosMenosChuck(isla).forEach({pajaro => pajaro.disminuirIra(5)})
	}
}

class InvasionDeCerditos inherits Evento{
	var invasores
		
	override method aplicarse(isla){
		const cantidad = invasores /100
		isla.enojarlosATodos(cantidad)
	}
	
}

class FiestaSorpresa inherits Evento{
	var homenajeados
	
	method agregarHomenajeado(pajaro) = homenajeados.add(pajaro)
	method sacarHomenajeado(pajaro) = homenajeados.remove(pajaro)
	
	override method aplicarse(isla){
		homenajeados.forEach({homenajeado => homenajeado.enojarse()})
	}
}

class SerieDeEventosDesafortunados inherits Evento{
	var listaDeEventos
	
	override method aplicarse(isla){
		listaDeEventos.forEach({evento => evento.aplicarse(isla)})
	}
}
