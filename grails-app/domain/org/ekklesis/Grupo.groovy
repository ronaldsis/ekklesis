package org.ekklesis

class Grupo {
	static searchable = true
    String nombre
    String descripcion
    Date dateCreated
    Date lastUpdated
    //static belongsTo=[tipoGrupo:TipoGrupo, iglesia:Iglesia]
    static belongsTo=[tipoGrupo:TipoGrupo, iglesia:Iglesia]
    static hasMany=[miembrosGrupo:MiembroGrupo, roles:RolGrupo]
 
    static constraints = {
		nombre()
		descripcion()
    }
     String toString(){
        "${nombre}"
    }
    static mapping = {
        tablePerHierarchy false
    }
}
