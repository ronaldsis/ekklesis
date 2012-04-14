package org.ekklesis

class Familia {
	static searchable = true
    String apellidos
    String direccionPrincipal
    String telefonoPrincipal
    Date dateCreated
    Date lastUpdated
    Date fechaMatrimonio
    String email
    Boolean status
    
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