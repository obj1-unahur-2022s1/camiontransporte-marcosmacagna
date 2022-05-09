object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
	method bultos() = 1
	method consecuenciasDeLaCarga(){}
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
	method bultos() = 2
	method consecuenciasDeLaCarga(){ if(self.auto()){self.transformar()}}
}

object paqueteLadrillos{
	var property ladrillos = 0
	
	method peso() = 2 * self.ladrillos()
	method nivelPeligrosidad() = 2
	method bultos() {
		if(ladrillos.between(0,100)){
			return 1
		}else if(ladrillos.between(101,300)) {
			return 2
		}else {
			return 3
		}
	}
	method consecuenciasDeLaCarga() {ladrillos += 12}
}

object arena {
	var property peso = 0
	
	method nivelPeligrosidad() = 1
	method bultos() = 1
	method consecuenciasDeLaCarga() {peso += 20}
}

object bateriaAntiarea {
	var property hayMisiles = false
	
	method peso() = if(hayMisiles){300} else{200}
	method nivelPeligrosidad() = if(hayMisiles){100} else{0}
	method bultos() = if(hayMisiles){2} else{1}
	method consecuenciasDeLaCarga() {self.hayMisiles(true)}
}

object contenedor {
	const cosas = []
	
	method cosas() = cosas
	method agregarListaDeCosas(unaLista) { cosas.addAll(unaLista) }
	method quitarListaDeCosas(unaLista) { cosas.removeAll(unaLista) }
	method peso() = cosas.sum( { c => c.peso() } ) + 100
	method nivelPeligrosidad() = if(self.cosas().isEmpty()){0}
								 else{cosas.max( { c => c.nivelPeligrosidad() } ).nivelPeligrosidad()}
	method bultos() = cosas.sum( { c => c.bultos() } ) + 1
	method consecuenciasDeLaCarga() {cosas.forEach( { c => c.consecuenciasDeLaCarga()} )}							  							
}

object residuosRadioactivos {
	var property peso = 0
	
	method nivelPeligrosidad() = 200
	method bultos() = 1
	method consecuenciasDeLaCarga() {peso += 15}
}

object embalajeSeguridad {
	var property objetoEmbalado
	
	method peso() = self.objetoEmbalado().peso()
	method nivelPeligrosidad() = self.objetoEmbalado().nivelPeligrosidad() / 2
	method bultos() = 2
	method consecuenciasDeLaCarga() {}
}