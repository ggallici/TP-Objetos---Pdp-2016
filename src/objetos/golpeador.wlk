import jugador.*

class Golpeador inherits Jugador
{
	var punteria
	
	constructor(_skills,_peso,_fuerza,_escoba, _punteria) = super(_skills,_peso,_fuerza,_escoba)
	{
		punteria = _punteria
	}
	
	method punteria() = punteria
	
	method punteria(_punteria)
	{
		punteria = _punteria
	}
	
	override method habilidad() = super() + punteria + fuerza
	
	override method hacerJugadaContra(unEquipo)
	{
		var victima = unEquipo.blancosUtilesPara(self).max({j=> j.habilidad()})
		
		if(victima.puedeSerGolpeadoPor(self))
		{
			victima.recibirGolpeBludgerDe(equipo)
			
			self.aumentarSkills(5)
		}
	}
}