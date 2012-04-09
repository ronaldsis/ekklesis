package org.ekklesis

class Iglesia {
    String rif
    String nombre
    String lema
    String versiculo
    String direccion
    String telefono
    String fax
    String web
    String email
    String twitter
    String facebook
    String organizacion
    byte[] imgLogo
    String imgTipo
    Date dateCreated
    Date lastUpdated
    // static belongsTo  = [organizacion:Organizacion]
    //static hashMany = [pastor:Organizacion]
    static constraints = {
        nombre(nullable:false, unique:true, blank:false, size:8..200)
        rif(nullable:true,size:1..12, unique:true)
        direccion(blank: false, size:5..250)
        imgLogo(nullable:true, maxSize: 16384 /* 16K */)
        imgTipo(nullable:true)
        web (url: true)
        email(email:true)
    }
    String toSring(){
			"{$nombre}"
    }
}
