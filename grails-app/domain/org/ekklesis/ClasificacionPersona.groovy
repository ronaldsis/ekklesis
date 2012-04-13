package org.ekklesis

class ClasificacionPersona {
    String clasificacion
    String descripcion

    static constraints = {
        clasificacion()
        descripcion()       
    }
    
    String toString(){
        clasificacion
    }
}
