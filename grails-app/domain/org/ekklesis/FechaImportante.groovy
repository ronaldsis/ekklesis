package org.ekklesis

class FechaImportante {
    Date fecha
    String ocasion
    String nota

    static constraints = {
        ocasion inList:['Nacimiento','Presentacion','Bautismo','Matrimonio','Grado','Otra']
    }
    
    static belongsTo = [persona:Persona]
    
    String toString(){
        ocasion + ' ' + nota
    }
}
