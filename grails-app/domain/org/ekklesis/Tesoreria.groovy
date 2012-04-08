package org.ekklesis

class Tesoreria {
    String nombre
    String descripcion
    static belongsTo=[grupo:Grupo]
    static hashMany=[movimientos:MovimientoDinero]
    static constraints = {
    }
}
