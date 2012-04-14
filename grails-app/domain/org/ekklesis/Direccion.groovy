package org.ekklesis

class Direccion {
	static searchable = true
    String dir
    String sector
    Municipio ciudad
    String tipo
    String status

    static belongsTo=[persona:Persona]
    
    static constraints = {
        dir()
        sector()
        ciudad()
        tipo inList:['Casa','Trabajo','Otra']
        status inList:['Principal','Activa','Inactiva']
    }
    static mapping = {
        dir type:'text'
    }
    String toString(){
        dir
    }
}
