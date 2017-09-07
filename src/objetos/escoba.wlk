class Escoba
{
	method velocidad()
	method recibirGolpe()
}

class SaetaDeFuego inherits Escoba
{	
	override method velocidad() = 100
	
	override method recibirGolpe () { }
}

class Nimbus inherits Escoba
{
	var anioFabricacion
	var salud
	
	constructor(_anioFabricacion,_salud)
	{
		anioFabricacion = _anioFabricacion
		salud = _salud
	}
	
	method salud() = salud
	
	method salud(_salud)
	{
		salud = _salud
	}
	
	method anioFabricacion() = anioFabricacion
	
	method anioFabricacion(_anioFabricacion)
	{
		anioFabricacion = _anioFabricacion
	}
	
	method antiguedad() = new Date().year() - anioFabricacion
	
	override method velocidad() = (80 - self.antiguedad()) * (salud / 100)
	
	override method recibirGolpe()
	{
		salud = (salud - 10).max(0)
	}
}