import personas.*

class Planeta {
	const property habitantes = #{}
	var property cantidadMuseos = 0
	var property longitudMurallas = 0
	
	method agregarPersona(unaPersona) = habitantes.add(unaPersona)
	
	method delegacionDiplomatica() = habitantes.filter({h => h.esDestacada()})
	method valorDefensa() = habitantes.count({h => h.potencia() >= 30})
	method esCulto() = cantidadMuseos >= 2 and habitantes.all({h => h.inteligencia() >= 10})
	method potenciaReal() = habitantes.sum({h => h.potencia()})
	method construirMurallas(unaCantidad) {longitudMurallas += unaCantidad}
	method fundarMuseo() {cantidadMuseos += 1}
	method potenciaAparente() = habitantes.max({h => h.potencia()}).potencia() * habitantes.size()
	method necesitaReforzarse() = self.potenciaAparente() >= self.potenciaReal() * 2
	// P generica no hace nada, P atleta 2km de muralla, P docente funda museo.
	method recibirTributos() = habitantes.forEach({h => h.ofrecerTributo()})
	method habitantesValiosos() = habitantes.filter({h => h.valor() >= 40})
	method recibirTributosDeHabitantesValiosos() = self.habitantesValiosos().forEach({h => h.ofrecerTributo()})
	// Cada habitante valioso del planeta ofrece su tributo a unPlaneta.
	method apaciguarPlaneta(unPlaneta) {unPlaneta.recibirTributosDeHabitantesValiosos()}
}