import plagas.*

class Hogar {
	var property nivelDeMugre = 0
	var property confort = 0
	
	method esBueno() = confort * 0.5 >= nivelDeMugre
	method sufrirAtaqueDe(unaPlaga) { 
		nivelDeMugre += unaPlaga.nivelDeDanio()
		unaPlaga.consecuenciasAtaque()
	} 
}

class Huerta {
	var property capacidadProduccion = 0
	
	method esBueno() = capacidadProduccion > nivelMinimoPedido.nivelMP()
	method sufrirAtaqueDe(unaPlaga) { 
		capacidadProduccion -= unaPlaga.nivelDeDanio() * 0.1
		if(unaPlaga.transmiteEnfermedades()) capacidadProduccion = 0.max(capacidadProduccion - 10)
		unaPlaga.consecuenciasAtaque()
	}
}

object nivelMinimoPedido {
	var property nivelMP = 20
}

class Mascota {
	var property nivelSalud = 250
	
	method esBueno() = nivelSalud > 250
	method sufrirAtaqueDe(unaPlaga) {
		if(unaPlaga.transmiteEnfermedades()) nivelSalud = 0.max(nivelSalud - unaPlaga.nivelDeDanio())
		unaPlaga.consecuenciasAtaque()
	}
}

class Barrio {
	const elementos = []
	method agregarElementos(unElemento) { elementos.add(unElemento) }
	method esCopado() = elementos.size() / 2 < self.cantElementosBuenos()
	method cantElementosBuenos() = elementos.count( { e=>e.esBueno() } )
	
}