class Obstaculo { //clase abstracta
		
	method resistencia() = 0
	
	method esDestruido(pajaro) = self.resistencia() < pajaro.fuerza()
	
}

class Pared inherits Obstaculo{//clase abstracta
	var ancho
	
	method ancho() = ancho

}

class ParedDeVidrio inherits Pared{
	
	override method resistencia() = 10 * self.ancho()
}

class ParedDeMadera inherits Pared{
	override method resistencia() = 25 * self.ancho()
}

class ParedDePiedra inherits Pared{
	override method resistencia() = 50 *self.ancho()
}

class CerditoObrero inherits Obstaculo{
	override method resistencia() = 50
}

class CerditoArmado inherits Obstaculo{
	var arma
	
	method resistenciaTotal() = arma.resistenciaArma() *10
}

class Arma{
	var resistenciaArma
	
	method resistenciaArma() = resistenciaArma
}
