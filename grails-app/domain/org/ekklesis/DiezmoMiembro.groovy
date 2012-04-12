package org.ekklesis

class DiezmoMiembro extends MovimientoDinero{
    static belongsTo =[miembro:MiembroIglesia]
    static constraints = {
    }
}
