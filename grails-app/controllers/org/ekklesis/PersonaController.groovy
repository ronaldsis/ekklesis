package org.ekklesis

import org.springframework.dao.DataIntegrityViolationException

class PersonaController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[personaInstanceList: Persona.list(params), personaInstanceTotal: Persona.count()]
	}

	def create() {
		[personaInstance: new Persona(params)]
	}

	def save() {
		//System.out.println(params);
		//def direcciones[] =
		def personaInstance = new Persona(params)
		def direcciones =  params.direccion
		//direccion.sector
		//	System.out.println(direcciones.size());
		//	System.out.println(direcciones.getClass());
		def d = [:]
		println direcciones.tipo.size()
		if(direcciones.ciudad.size()>1) {

			
			
			direcciones.ciudad.size().times { i->
				System.out.println('direccion['+ i + '] ' + direcciones.dir[i]);
				System.out.println('sector['+i + '] ' + direcciones.sector[i]);
				System.out.println('ciudad['+i + '] ' + direcciones.ciudad[i]);
				System.out.println('status['+i + '] ' + direcciones.status[i]);
				System.out.println('tipo['+i + '] ' + direcciones.tipo[i]);
				System.out.println('********************************************');
				d = [:]
				d = [
							'dir'    : direcciones.dir[i],
							'sector' : direcciones.sector[i],
							'ciudad' : Municipio.get(direcciones.ciudad[i]),
							'status' : direcciones.status[i],
							'tipo'   : direcciones.tipo[i],
							'persona': personaInstance.id
						]

				personaInstance.addToDirecciones(new Direccion(d) );
			}
		}else {
			d = [:]
			d = [
						'dir'    : direcciones.dir,
						'sector' : direcciones.sector,
						'ciudad' : Municipio.get(direcciones.ciudad),
						'status' : direcciones.status,
						'tipo'   : direcciones.tipo,
						'persona': personaInstance.id
					]
			personaInstance.addToDirecciones(new Direccion(d) )
		}

		if (!personaInstance.save(flush: true)) {
			render(view: "create", model: [personaInstance: personaInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'persona.label', default: 'Persona'),
			personaInstance.id
		])
		redirect(action: "show", id: personaInstance.id)
	}

	def show() {
		def personaInstance = Persona.get(params.id)
		if (!personaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'persona.label', default: 'Persona'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[personaInstance: personaInstance]
	}

	def edit() {
		def personaInstance = Persona.get(params.id)
		if (!personaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'persona.label', default: 'Persona'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[personaInstance: personaInstance]
	}

	def update() {
		def personaInstance = Persona.get(params.id)
		if (!personaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'persona.label', default: 'Persona'),
				params.id
			])
			redirect(action: "list")
			return
		}

		if (params.version) {
			def version = params.version.toLong()
			if (personaInstance.version > version) {
				personaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'persona.label', default: 'Persona')]
						as Object[],
						"Another user has updated this Persona while you were editing")
				render(view: "edit", model: [personaInstance: personaInstance])
				return
			}
		}

		personaInstance.properties = params

		if (!personaInstance.save(flush: true)) {
			render(view: "edit", model: [personaInstance: personaInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'persona.label', default: 'Persona'),
			personaInstance.id
		])
		redirect(action: "show", id: personaInstance.id)
	}

	def delete() {
		def personaInstance = Persona.get(params.id)
		if (!personaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'persona.label', default: 'Persona'),
				params.id
			])
			redirect(action: "list")
			return
		}

		try {
			personaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'persona.label', default: 'Persona'),
				params.id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'persona.label', default: 'Persona'),
				params.id
			])
			redirect(action: "show", id: params.id)
		}
	}
}
