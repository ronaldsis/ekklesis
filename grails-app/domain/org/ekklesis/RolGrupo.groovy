
package org.ekklesis
class RolGrupo {
    String rol
    String descripcion
    static belongsTo=[grupo: Grupo]    
    static hasMany=[miembrosRol: MiembroGrupo]    
    
    static constraints = {
    }
    
    String toString(){
        descripcion
    }
    
}
