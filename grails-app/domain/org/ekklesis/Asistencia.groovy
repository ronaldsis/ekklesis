package org.ekklesis

class Asistencia {
    
    Date fecha
    String Nota
    static belongsTo=[reunion:Reunion, persona:Persona]
    //static hasMany=[persona:AsistenciaPersona]    

    static constraints = {
    }
}
