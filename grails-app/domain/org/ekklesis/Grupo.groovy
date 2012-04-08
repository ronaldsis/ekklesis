package org.ekklesis

class Grupo {
    String nombre
    String descripcion
    Date dateCreated
    Date lastUpdated
    static belongsTo=[tipoGrupo:TipoGrupo, iglesia:Iglesia]
    static hashMany=[miembrosGrupo:MiembroGrupo, roles:RolGrupo]
 
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
