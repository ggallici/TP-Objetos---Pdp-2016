import excepciones.*

class Equipo 
{
	var jugadores
	var puntos = 0
	
	constructor(_jugadores)
	{
		jugadores = _jugadores
		
		jugadores.forEach({j => j.equipo(self)})
	}
	
	method jugadores() = jugadores
	
	method jugadores(_jugadores)
	{
		jugadores = _jugadores
	}
	
	method puntos() = puntos
	
	method puntos(_puntos)
	{
		puntos = _puntos
	}
	
	method habilidadPromedio() = jugadores.sum({ju => ju.habilidad()})/jugadores.size()
	
	method jugadoresGrosos() = jugadores.filter({j => j.esGroso()})
	
	method tieneJugadorEstrellaContra(otroEquipo) = jugadores.any({j1 => j1.esJugadorEstrellaContra(otroEquipo)})
	
	method tieneLaQuaffle() = jugadores.any({j=> j.tieneQuaffle()})
	
	method elQueTieneLaQuaffle() = jugadores.find({j => j.tieneQuaffle()})
	
	method obtenerLaQuaffle()
	{
		if(self.tieneLaQuaffle())
		{
			throw new YaTieneLaQuaffleException()   
        }
        
		jugadores.filter({j => j.puedeObtenerQuaffle()}).max({j => j.velocidad()}).obtenerQuaffle()
	}
	
	method perderLaQuaffleContra(unEquipo)
	{
		self.elQueTieneLaQuaffle().perderQuaffleContra(unEquipo)
	}
	
	method ganarPuntos(_puntos)
	{
		puntos += _puntos
	}
	
	method blancosUtilesPara(unGolpeador) = jugadores.filter({j=> j.esBlancoUtilPara(unGolpeador)})
	
	method bloquear(unCazador)
	{
		var j = jugadores.filter({j =>j.puedeBloquearA(unCazador)}).max({j => j.velocidad()})
			
		j.ganarSkillsPorBloqueo()
				
		unCazador.aumentarSkills(-3)
	}
	
	method repartirQuaffle()
	{
		jugadores.filter({j => j.puedeObtenerQuaffle()}).max({j => j.habilidad()}).obtenerQuaffle()
	}
}