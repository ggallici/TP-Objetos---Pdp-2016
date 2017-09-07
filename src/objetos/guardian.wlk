import jugador.*

class Guardian inherits Jugador
{
	constructor(_skills,_peso,_fuerza,_escoba) = super(_skills,_peso,_fuerza,_escoba)
	
	override method reflejos() = super() + 20
	
	override method habilidad() = super() + self.reflejos() + fuerza
	
	override method puedeObtenerQuaffle() = false//true
	
	method obtenerQuaffle()
	{
		equipo.repartirQuaffle()
	}
	
	override method esBlancoUtilSegunPosicion() = !equipo.tieneLaQuaffle()
	
	override method ganarSkillsPorBloqueo()
	{
		self.aumentarSkills(10)
	}
	
	override method hacerJugadaContra(unEquipo) {	}
}