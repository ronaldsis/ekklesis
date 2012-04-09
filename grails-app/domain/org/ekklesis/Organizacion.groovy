package org.ekklesis

class Organizacion {
    String nombre
    Date fechaFundacion
    String direccion
    String web
    String email
    String zip
    String telefono
    Persona lider
    static hasMany=[iglesias:Iglesia]
    static constraints = {
    }
    String toString(){
	nombre
    }
}
