package org.ekklesis

class Reunion {
    
    String titulo
    String ubicacion
    String descripcion

    Date inicio
    Date fin
    
    static hasMany=[
        personas:ReunionPersona,
        asistencias:Asistencia
    ]
    
    static constraints = {
        titulo(nullable: false, blank: false)
        ubicacion(nullable: true, blank:  true)
        descripcion(nullable: true, blank: true)
        inicio(nullable: false)
        fin(nullable: true)
    }

    
}
