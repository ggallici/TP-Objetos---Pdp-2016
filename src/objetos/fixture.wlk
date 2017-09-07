import buscador.*
import cazador.*
import golpeador.*
import guardian.*
import equipo.*
import escoba.*

object fixture
{
	const adrian = new Cazador(30,80,70,new Nimbus(2000,70),4)
	
	const vincent = new Golpeador(80,75,80, new SaetaDeFuego(),8)
	
	const graham = new Cazador(35,65,85,new SaetaDeFuego(),6)
	
	const gregory = new Golpeador(70,65,90,new SaetaDeFuego(),15)
	
	const warrington = new Cazador(32,50,70,new SaetaDeFuego(),5)
	
	const miles = new Guardian(20,80,50,new SaetaDeFuego())
	
	const draco = new Buscador(27,50,30, new Nimbus(2001,100),7)
		
	const angelina = new Cazador(40,55,40,new SaetaDeFuego(),3)
	
	const fred = new Golpeador(80,80,90,new Nimbus(2001,80),18)
	
	const katie  = new Cazador(45,60,30,new SaetaDeFuego(),4)
	
	const george = new Golpeador(70,80,70,new Nimbus(2001,50),17)
	
	const ginny = new Cazador(50,50,40,new Nimbus(2000,50),5)
	
	const ron = new Guardian(30,60,50,new Nimbus(2000,50))
	
	const harry  = new Buscador(30,60,50,new SaetaDeFuego(),2)
	
	const slytherin = new Equipo(#{adrian, vincent, graham, gregory, warrington, miles, draco})
	
	const gryffindor = new Equipo(#{angelina, fred, katie, george, ginny, ron, harry})
	
	const equipoVacio = new Equipo(#{})
	
	
	
	method adrian() = adrian
	
	method vincent() = vincent
	
	method graham() = graham
	
	method gregory() = gregory
	
	method warrington() = warrington
	
	method miles() = miles
	
	method draco() = draco
	
	method angelina() = angelina
	
	method fred() = fred
	
	method katie() = katie
	
	method george() = george
	
	method ginny() = ginny
		
	method ron() = ron
	
	method harry() = harry
	
	method slytherin() = slytherin
	
	method gryffindor() = gryffindor
	
	method equipoVacio() = equipoVacio
}