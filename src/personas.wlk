import planetas.*

// Superclase.
class Persona {
	var property edad
	
	method inteligencia() {
		if (edad >= 20 and edad <= 40) return 12
		else return 8
	}	
	method potencia() = 20
	method esDestacada() = edad == 25 or edad == 35
	
	method ofrecerTributo(planeta) {}
	
	method valor() = self.inteligencia() + self.potencia()
}

// Subclase de Persona.
class Atleta inherits Persona {
	var property masaMuscular = 4
	var property cantidadTecnicas = 2
	
	override method potencia() = super() + (masaMuscular * cantidadTecnicas)
	override method esDestacada() = super() or cantidadTecnicas > 5
	
	override method ofrecerTributo(planeta) {planeta.construirMurallas(2)}
	
	method entrenar(cantDias) {masaMuscular += cantDias.div(5)}
	method aprenderTecnica() {cantidadTecnicas += 1}
}

// Subclase de Persona.
class Docente inherits Persona {
	var property cantidadCursos = 0
	
	override method inteligencia() = super() + (cantidadCursos * 2)
	override method esDestacada() = cantidadCursos > 3
	
	// No se si está bien.
	override method ofrecerTributo(planeta) {planeta.fundarMuseo()}
	
	override method valor() = super() + 5
}

class Soldado inherits Persona {
	const property coleccionArmas = []
	
	method potenciaDeColeccionArmas() = coleccionArmas.sum({a => a.potencia()})
	override method potencia() = self.valor() + self.potenciaDeColeccionArmas()
	
	// No se si está bien.
	override method ofrecerTributo(planeta) {planeta.construirMurallas(5)}
}

class Pistolete inherits Soldado {
	var property centimetros
	
	override method potencia() {
		if (self.edad() > 30) return centimetros * 3
		else return centimetros * 2
	}
}

class Espadon inherits Soldado {
	var property peso
	
	override method potencia() {
		if (self.edad() < 40) return peso / 2
		else return 6
	}
}