package org.ekklesis

class MiembroFamilia {
	static searchable = true
    String rol
    static belongsTo=[familia:Familia, persona:Persona]
    static constraints = {
        rol(inList: ["Cabeza de Hogar","Esposa", "Hijo","Hija","Abuelo","Abuela","Tio","Tia","Primo", "Prima"])
    }
    String toString(){
        "${apellidos}, ${nombres}"

    }
}