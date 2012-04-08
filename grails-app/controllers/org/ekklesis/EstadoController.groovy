package org.ekklesis
import grails.converters.*

class EstadoController {

    def index() { }
	
	def ajaxGetMunicipios ={
		def estado = Estado.get(params.id)
		render estado?.municipios as JSON
	}
	def ajaxGetEstados = {
		def estados= Estado.list()
		render estados as JSON
		}
}
