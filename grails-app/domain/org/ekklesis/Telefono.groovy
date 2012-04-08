package org.ekklesis

class Telefono {
	String codArea
	String numero
	String tipo
	String status
        
    static belongsTo = [
        persona:Persona
    ]
    
    static constraints = {
		tipo inList:['Casa','Trabajo','Colegio','Movil']
		codArea matches:"[0-9]{4}"
		numero  matches:"[0-9]{7}"
		status inList:['Principal','Activo','Inactivo']
    }
}
