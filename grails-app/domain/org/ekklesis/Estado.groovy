package org.ekklesis

class Estado {
	String nombre
	static hasMany = [municipios:Municipio]
	static constraints = {
	}
        
    String toString(){
        nombre
    }
    
}
