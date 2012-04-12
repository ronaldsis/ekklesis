package org.ekklesis

class Tesoreria {
    String nombre
    String descripcion
    static belongsTo=[grupo:Grupo]
    static hasMany=[movimientos:MovimientoDinero]
    static constraints = {
    }
}
