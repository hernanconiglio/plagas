class Plaga {
	var property poblacion = 0
	method nivelDeDanio() = poblacion
	method transmiteEnfermedades() = poblacion >= 10
	method consecuenciasAtaque() { poblacion += poblacion * 0.1}
	method ataqueElemento(elemento) { elemento.sufrirAtaqueDe(self) }
}


class Cucarachas inherits Plaga {
	var property pesoPromedio = 0
	
	override method nivelDeDanio() = super() * 0.5
	override method transmiteEnfermedades() = super() && pesoPromedio >= 10
	override method consecuenciasAtaque() {
		super()
		pesoPromedio += 2
	}
}

class Pulgas inherits Plaga {
	override method nivelDeDanio() = super() * 2
	
}

class Garrapatas inherits Pulgas {
	override method consecuenciasAtaque() { poblacion *= 1.2 }
}

class Mosquitos inherits Plaga {
	override method transmiteEnfermedades() = super() && poblacion % 3 == 0
}

