import artefactos.*

object rolando {
	var capacidad = 2
	const property artefactos = #{}
	var hogar = castillo
	const property historialDeArtefactos = []
	
	method agarrar(artefacto) {
		if (self.tieneCapacidad()) {
			artefactos.add(artefacto)
		}
		historialDeArtefactos.add(artefacto)
	}
	
	method tieneCapacidad() {
		return artefactos.size() < capacidad
	}
	
	method irAlHogar() {
		self.guardarArtefactosEnHogar()
		self.liberarEspacio()
	}
	
	method guardarArtefactosEnHogar() {
		hogar.guardarTodosLosArtefactos(artefactos)
	}
	
	method liberarEspacio() {
		artefactos.clear()
	}
	
	method posee(artefacto) {
		return self.todasLasPosesiones().contains(artefacto)
	}
	
	method todasLasPosesiones() {
		return artefactos.union(hogar.baul())
	}
}

object castillo {
	const property baul = #{}
	
	method agarrar(artefacto) {
		baul.add(artefacto)
	}
	
	method guardarTodosLosArtefactos(artefactos) {
		baul.addAll(artefactos)
	}
}