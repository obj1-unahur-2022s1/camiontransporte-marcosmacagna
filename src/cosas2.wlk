/*
 * cosas2: Bien! Solo te dejé algunas sugerencias en el código.
 */

object knightRider {
	/* Bien! */
	method peso() = 500
	method nivelPeligrosidad() = 10
	method bultos() = 1
	method consecuenciasDeLaCarga(){}
}

object bumblebee {
	/* Bien. Para manejar el estado del objeto, si es auto o robot, alcanzaba con utilizar
	 * solo 1 variable booleana. Te dejo como podría ser esa solución.
	 */
	// inicialice las var auto y robot, para que pueda funcionar el method transformar.
	// El mismo sirve para evitar que bumblebee sea auto y robot a la vez (para evitar
	// auto == true y robot == true al mismo tiempo).
	var property esAuto = true
	
	method peso() = 800
	method nivelPeligrosidad() = if(esAuto){15} else{30}
	method transformar(){ esAuto = !esAuto }
	method bultos() = 2
	method consecuenciasDeLaCarga(){ esAuto = false }
}

object paqueteLadrillos{
	/* Bien! Te dejo una solución para el método bultos() que no utiliza if */
	var property ladrillos = 0
	
	method peso() = 2 * ladrillos //Acá se puede usar también la variable directamente
	method nivelPeligrosidad() = 2
	method bultos() = (2.min(1.max(ladrillos-99))).max(3.min(ladrillos-298))
	method consecuenciasDeLaCarga() {ladrillos += 12}
}

object arena {
	/* Bien! */
	var property peso = 0
	
	method nivelPeligrosidad() = 1
	method bultos() = 1
	method consecuenciasDeLaCarga() {peso += 20}
}

object bateriaAntiarea {
	/* Bien! */
	var property hayMisiles = false
	
	method peso() = if(hayMisiles){300} else{200}
	method nivelPeligrosidad() = if(hayMisiles){100} else{0}
	method bultos() = if(hayMisiles){2} else{1}
	method consecuenciasDeLaCarga() {self.hayMisiles(true)}
}

object contenedor {
	/* Bien! Solo a modo de sugerencia, tal vez podrías haber hecho un método auxiliar
	 * para obtener el objeto (cosa) más peligroso de la lista de cosas y luego usarlo en
	 * nivelPeligrosidad(), y ahí queda más simplificada la expresión. Te dejo escrito
	 * en el código.
	 */
	const cosas = []
	
	method cosas() = cosas
	method agregarListaDeCosas(unaLista) { cosas.addAll(unaLista) }
	method quitarListaDeCosas(unaLista) { cosas.removeAll(unaLista) }
	method peso() = cosas.sum( { c => c.peso() } ) + 100
	method nivelPeligrosidad() = if(self.cosas().isEmpty()){0}
								 else{self.cosaMasPeligrosa().nivelPeligrosidad()}
								 
	method cosaMasPeligrosa() = cosas.max( { c => c.nivelPeligrosidad() } )
	method bultos() = cosas.sum( { c => c.bultos() } ) + 1
	method consecuenciasDeLaCarga() {cosas.forEach( { c => c.consecuenciasDeLaCarga()} )}							  							
}

object residuosRadioactivos {
	/* Bien! */
	var property peso = 0
	
	method nivelPeligrosidad() = 200
	method bultos() = 1
	method consecuenciasDeLaCarga() {peso += 15}
}

object embalajeSeguridad {
	/*  */
	var property objetoEmbalado
	
	method peso() = objetoEmbalado.peso() //Acá también podés usar directo la variable
	method nivelPeligrosidad() = self.objetoEmbalado().nivelPeligrosidad() / 2
	method bultos() = 2
	method consecuenciasDeLaCarga() {}
}