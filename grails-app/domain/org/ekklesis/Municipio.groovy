package org.ekklesis

class Municipio {
	String nombre
	static belongsTo = [estado:Estado]
    static constraints = {
    }
	String toString( )
	{ nombre}
}
