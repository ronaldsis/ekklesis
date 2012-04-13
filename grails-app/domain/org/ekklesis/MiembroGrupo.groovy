/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author luix
 */

package org.ekklesis

class MiembroGrupo  {
    Date fechaIngreso
	Date fechaSalida
    Boolean estatus

    static belongsTo=[
        persona:Persona,
        rol:RolGrupo, grupo:Grupo
    ]

	static constraints = {
			fechaSalida nullable:true	
		}
	
    String toString(){
        "${nombres}"
    }
}
