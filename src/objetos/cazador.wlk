import jugador.*
import excepciones.*

class Cazador inherits Jugador
{
	var punteria
	var quaffle = false
	
	constructor(_skills,_peso,_fuerza,_escoba, _punteria) = super(_skills,_peso,_fuerza,_escoba)
	{
		punteria = _punteria
	}
	
	method punteria() = punteria
	
	method punteria(_punteria)
	{
		punteria = _punteria
	}
	
	override method habilidad() = super() + punteria * fuerza
	
	override method tieneQuaffle() = quaffle
	
	override method puedeObtenerQuaffle() = true
	
	override method recibirGolpeBludgerDe(unEquipo)
	{
		super(unEquipo)
		
		try 
		{ 
			self.perderQuaffleContra(unEquipo)
		} 
		catch e : NoTieneLaQuaffleException { }
	}
	
	method obtenerQuaffle()
	{		
		quaffle = true
	}
	
	method perderQuaffleContra(unEquipo)
	{		
		if(self.tieneQuaffle())
		{														
			quaffle = false
			
			unEquipo.obtenerLaQuaffle()
		}
		else
		{
			throw new NoTieneLaQuaffleException()
		}
	}
	
	override method esBlancoUtilSegunPosicion() = self.tieneQuaffle()
	
	method hacerGol()
	{
		equipo.ganarPuntos(10)
	}
	
	override method hacerJugadaContra(unEquipo)
	{
		if(self.tieneQuaffle())
		{
			self.perderQuaffleContra(unEquipo)
			
			try
			{
				unEquipo.bloquear(self)	
			}
			catch e : ElementNotFoundException
			{
				self.hacerGol()
				
				self.aumentarSkills(5)
			}
		}
	}
}