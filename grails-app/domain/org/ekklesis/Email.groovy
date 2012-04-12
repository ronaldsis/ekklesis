package org.ekklesis

class Email {
    String tipo
    String email
    String status

    static belongsTo=[
        persona:Persona
    ]
    static constraints = {
        tipo inList:['Personal','Trabajo','Proyectos', 'Ministerio']
        email email:true
        tipo inList:['Principal','Activo','Inactivo']
    }
}
