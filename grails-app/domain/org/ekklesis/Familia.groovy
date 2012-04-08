package org.ekklesis

class Familia {
    String apellidos
    Direccion direccionPrincipal
    Telefono telefonoPrincipal
    Date dateCreated
    Date lastUpdated
    Date fechaMatrimonio
    String email
    String status
    
    static hasMany = [miembrosFamilia:MiembroFamilia]
    static belongsTo = [iglesia:Iglesia]
    
    static constraints = {
        apellidos()
        telefonoPrincipal ()
        direccionPrincipal()
        fechaMatrimonio()
        email nullable:true, email:true
        

    }
    String toString(){
               "${apellidos}"
    }
}