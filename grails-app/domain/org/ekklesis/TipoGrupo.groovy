package org.ekklesis

class TipoGrupo {
    String nombre
    String descripcion
    static hashMany = [grupos:Grupo]
    static constraints = {
        descripcion(maxSize:1000)
    }
    String toString(){
        "${nombre}"
    }
}
