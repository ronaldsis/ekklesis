package org.ekklesis

class Persona {
    String nombres
    String apellidos
    String sexo
    Date dateCreated
    Date lastUpdated
    byte[] imgFoto
    String imgTipo
    //redes sociales
    String facebook
    String twitter
    
    static hasMany=[
        direcciones:Direccion,
        telefonos:Telefono, 
        emails:Email,
        fechasImportantes:FechaImportante,
        membresiasGrupos:MiembroGrupo
    ]
    
    static belongsTo=[
        iglesia:Iglesia,
        clasificacion:ClasificacionPersona,
        familia:Familia 
    ]
    
    static constraints = {
        nombres blank: false
        apellidos blank: false
		familia nullable:true
		imgFoto nullable:true
		imgTipo nullable:true
		
    }
    static mapping = {
        tablePerHierarchy false
    }
    
    String toString(){
        nombres + ' ' + apellidos
    }
}
