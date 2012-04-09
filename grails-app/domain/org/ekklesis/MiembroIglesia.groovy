package org.ekklesis


class MiembroIglesia extends Persona{

    String cedula
    Date fechaBautismo
    Date fechaMembresia
    static belongsTo=[razon:RazonMembresia, iglesia:Iglesia]
    static hasMany=[diezmos:DiezmoMiembro]
    static constraints = {
    }
}
