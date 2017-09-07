import jugador.*
import suerte.*
import excepciones.*

class Buscador inherits Jugador
{
	var vision
	
	var turnos
	
	var metrosRecorridos
	
	var estado = normal
	var actividad = buscando
	
	constructor(_skills,_peso,_fuerza,_escoba, _vision) = super(_skills,_peso,_fuerza,_escoba)
	{
		vision = _vision
	}
	
	method vision() = vision
	
	method vision(_vision)
	{
		vision = _vision
	}
	
	method turnos() = turnos
	
	method turnos(_turnos)
	{
		turnos = _turnos
	}
	
	method actividad() = actividad
	
	method actividad(_actividad)
	{
		actividad = _actividad
	}
	
	method metrosRecorridos() = metrosRecorridos
	
	method metrosRecorridos(_metrosRecorridos)
	{
		metrosRecorridos = _metrosRecorridos
	}
	
	override method habilidad() = super() + self.reflejos() * vision
	
	override method hacerJugadaContra(unEquipo)
	{
		estado.accionarSegunEstado(self)
	}
	
	override method recibirGolpeBludgerDe(unEquipo)
	{
		super(unEquipo)
		
		if(!self.esGroso())
		{
			self.reiniciarBusqueda()
		}
		else 
		{
			self.aturdirse()
		}
	}
	
	method reiniciarBusqueda()
	{
		actividad = buscando
	
		turnos = 0
	
		metrosRecorridos = 0
	}
	
	method aturdirse()
	{
		estado = aturdido
	}
	
	method encontroSnitch() = actividad == persiguiendo
	
	override method esBlancoUtilSegunPosicion() = self.encontroSnitch() && self.metrosRecorridos() > 4000
	
	override method puedeBloquearA(unCazador) = false
	
	method perseguir()
	{
		metrosRecorridos += (2 * self.velocidad())
				
		if(metrosRecorridos >= 5000)
		{
			equipo.ganarPuntos(150)
				
			self.aumentarSkills(30)
		}
	}
	
	method buscar()
	{
		turnos++
			
		if((1..turnos+vision).fold(true, {semilla => semilla && suerte.tieneSuerte()}))
		{
			actividad = persiguiendo
		}
	}
	
	method recuperarseAturdimiento()
	{
		estado = normal
	}
}

object buscando
{
	method accionarSegunActividad(unBuscador)
	{
		unBuscador.buscar()
	}
}

object persiguiendo
{
	method accionarSegunActividad(unBuscador)
	{
		unBuscador.perseguir()
	}
}

object aturdido
{
	method accionarSegunEstado(unBuscador)
	{
		unBuscador.recuperarseAturdimiento()
	}
}

object normal
{
	method accionarSegunEstado(unBuscador)
	{
		self.actividadDe(unBuscador).accionarSegunActividad(unBuscador)
	}
	
	method actividadDe(unBuscador) = unBuscador.actividad()
}