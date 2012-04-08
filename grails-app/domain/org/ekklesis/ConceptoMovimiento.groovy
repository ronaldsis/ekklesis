/*
 * Concepto de los Movimientos
 * Por ej. Diezmos, Ofrendas, Pro-Construcción,
 *
 **/
package org.ekklesis

class ConceptoMovimiento {
    String nombre
    String descripcion
    String tipoMovimiento
    Boolean activo
    static constraints = {
        tipoMovimiento(inList:["Entrada", "Salida"])
    }
    String toString(){
        "${nombre}"
    }
}
