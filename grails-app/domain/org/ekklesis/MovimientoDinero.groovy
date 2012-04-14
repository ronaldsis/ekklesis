package org.ekklesis
class MovimientoDinero {
    Date fecha
    Float monto
    String tipoPago
    String referencia
    static belongsTo=[tesoreria:Tesoreria, concepto:ConceptoMovimiento]
    static constraints = {
        tipoPago(inList: ["Efectivo","Cheque","Depósito"])
    }
    static mapping = {
        tablePerHierarchy false
    }
}
