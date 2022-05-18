/* 
 * camion2: Bien! 
 * Ojo que te había quedado importado el archivo cosas.*, y debía ser cosas2.*
 * 
 */ 
import cosas2.*

object camion {

	const carga = []
	
	method cargar(cosa) { carga.add(cosa)  cosa.consecuenciasDeLaCarga()}
	method descargar(cosa) { carga.remove(cosa) }
	method todoPesoPar() = carga.all( { c => c.peso().even() } )
	method hayAlgunoQuePesa(peso) = carga.any( { c => c.peso() == peso } )
	method elDeNivel(nivel) = carga.find( { c => c.nivelPeligrosidad() == nivel } )
	method pesoTotal() = carga.sum( { c => c.peso() } ) + 1000
	method excedidoDePeso() = self.pesoTotal() > 2500
	method objetosQueSuperanPeligrosidad(nivel) = carga.filter( { c => c.nivelPeligrosidad() > nivel } )
	method objetosMasPeligrososQue(cosa) = carga.filter( { c => c.nivelPeligrosidad() > cosa.nivelPeligrosidad() } )
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = not self.excedidoDePeso() and 
														  self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	method tieneAlgoQuePesaEntre(min, max) = carga.any( { c => c.peso().between(min,max) } )
	method cosaMasPesada() = carga.max( { c => c.peso() } )
	method pesos() = carga.map( { c => c.peso() } )
	method totalBultos() = carga.sum( { c => c.bultos() } )													  
}