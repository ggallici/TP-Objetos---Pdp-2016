import excepciones.*
import suerte.*

class Jugador 
{
	const _VELOCIDAD_MINIMA_MERCADO = 50
	
	var skills
	var peso
	var fuerza
	var escoba
	var equipo
	
	constructor(_skills, _peso, _fuerza, _escoba) 
	{
		skills = _skills
		peso = _peso
		fuerza = _fuerza
		escoba = _escoba
	}
	
	method skills() = skills
	
	method skills(_skills)
	{
		skills = _skills
	}
	
	method peso() = peso
	
	method peso(_peso)
	{
		peso = _peso
	}
	
	method fuerza() = fuerza
	
	method fuerza(_fuerza)
	{
		fuerza = _fuerza
	}
	
	method escoba() = escoba
	
	method escoba(_escoba)
	{
		escoba = _escoba
	}
	
	method equipo() = equipo
	
	method equipo(_equipo)
	{
		if(equipo != null)
		{
			equipo.remove(self)
		}
		equipo = _equipo
	}
	
	method nivelManejoEscoba() = skills / peso
	
	method velocidad() = escoba.velocidad() * self.nivelManejoEscoba()
	
	method habilidad() = self.velocidad() + skills
	
	method reflejos() = self.velocidad() * skills / 100
	
	method lePasaElTrapoA(otroJugador) = self.habilidad() >= 2 * otroJugador.habilidad()
	
	method recibirGolpeBludgerDe(unEquipo)
	{
		self.aumentarSkills(-2)
		
		escoba.recibirGolpe()
	}
	
	method tieneQuaffle() = false
	
	method puedeObtenerQuaffle() = false
	
	method hacerJugadaContra(unEquipo)
	
	method esGroso() = self.habilidad() > equipo.habilidadPromedio() && self.velocidad() >= _VELOCIDAD_MINIMA_MERCADO
	
	method esJugadorEstrellaContra(otroEquipo) = otroEquipo.jugadores().all({j2 => self.lePasaElTrapoA(j2)})
	
	method esBlancoUtilPara(unGolpeador) = self.esJugadorEstrellaContra(unGolpeador.equipo()) || self.esBlancoUtilSegunPosicion()
	
	method puedeSerGolpeadoPor(unGolpeador) = (self.reflejos() < unGolpeador.punteria()) || suerte.tieneSuerte()
	
	method puedeBloquearA(unCazador) = self.lePasaElTrapoA(unCazador) || suerte.tieneSuerte()
	
	method ganarSkillsPorBloqueo()
	{
		self.aumentarSkills(3)
	}
	
	method aumentarSkills(puntos)
	{
		skills = skills + puntos
	}
	
	method esBlancoUtilSegunPosicion() = false
}