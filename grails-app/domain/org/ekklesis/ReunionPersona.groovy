package org.ekklesis

class ReunionPersona {

    static belongsTo = [reunion: Reunion, persona:Persona]
    
    static constraints = {
    }
}
