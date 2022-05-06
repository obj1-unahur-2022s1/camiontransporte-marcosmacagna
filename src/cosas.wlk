object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
}

object bumblebee {
	// inicialice las var auto y robot, para que pueda funcionar el method transformar.
	// El mismo sirve para evitar que bumblebee sea auto y robot a la vez (para evitar
	// auto == true y robot == true al mismo tiempo).
	var property auto = true
	var property robot = false
	
	method peso() = 800
	method nivelPeligrosidad() = if(self.auto()){15} else{30}
	method transformar(){ self.auto(not auto) self.robot(not robot) }
}

object paqueteLadrillos{
	// inicialice la var ladrillos en cero, para que no haya errores en el method peso()
	// en el caso que no haya ladrillos.
	var property ladrillos = 0
	
	method peso() = 2 * self.ladrillos()
	method nivelPeligrosidad() = 2
}

object arena {
	var property peso
	
	method nivelPeligrosidad() = 1
}

object bateriaAntiarea {
	// hayMisiles maneja booleanos.
	var property hayMisiles
	
	method peso() = if(hayMisiles){300} else{200}
	method nivelPeligrosidad() = if(hayMisiles){100} else{0}
}

object contenedor {
	const cosas = []
	
	method cosas() = cosas
	method agregarListaDeCosas(unaLista) { cosas.addAll(unaLista) }
	method peso() = cosas.sum( { c => c.peso() } ) + 100
	method nivelPeligrosidad() = if(self.cosas() != []){cosas.max( { c => c.nivelPeligrosidad() } ).nivelPeligrosidad()}
								 else{0} 							
}

object residuosRadioactivos {
	var property peso
	
	method nivelPeligrosidad() = 200
}

object embalajeSeguridad {
	var property objetoEmbalado
	
	method peso() = self.objetoEmbalado().peso()
	method nivelPeligrosidad() = self.objetoEmbalado().nivelPeligrosidad() / 2
}