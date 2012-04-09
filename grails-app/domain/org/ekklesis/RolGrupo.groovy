
package org.ekklesis
class RolGrupo {
    String rol
    String descripcion
    static belongsTo=[grupo:Grupo]
    static hasMany=[
        grupos:Grupo
    ]
    static constraints = {
    }
}
