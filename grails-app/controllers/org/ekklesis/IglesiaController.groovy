package org.ekklesis

import org.springframework.dao.DataIntegrityViolationException

class IglesiaController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def upload_logo = {
		def iglesia = new Iglesia(params)
		def f = request.getFile('logo')

		// List of OK mime-types
		def okcontents = [
			'image/png',
			'image/jpeg',
			'image/gif']
		if (! okcontents.contains(f.getContentType()))
		{
			flash.message = "Logo debe ser uno de los siguientes tipos: ${okcontents}"
			render(view:'select_logo', model:[iglesia:iglesia])
			return;

		}
		
		iglesia.imgLogo = f.getBytes()
		iglesia.imgTipo = f.getContentType()
		log.info("Archivo subido: " + iglesia.imgTipo)
		
		if (!iglesia.save()) {
			render(view:'select_logo', model:[iglesia:iglesia])
			return;
		  }
		flash.message = "Logo (${iglesia.imgTipo}, ${iglesia.imgLogo.size()}  bytes) Cargados."
		redirect(action:'show')
	}

	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[iglesiaInstanceList: Iglesia.list(params), iglesiaInstanceTotal: Iglesia.count()]
	}

	def create() {
		[iglesiaInstance: new Iglesia(params)]
	}

	def save() {
		def iglesiaInstance = new Iglesia(params)
		if (!iglesiaInstance.save(flush: true)) {
			render(view: "create", model: [iglesiaInstance: iglesiaInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'iglesia.label', default: 'Iglesia'),
			iglesiaInstance.id
		])
		redirect(action: "show", id: iglesiaInstance.id)
	}

	def show() {
		def iglesiaInstance = Iglesia.get(params.id)
		if (!iglesiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'iglesia.label', default: 'Iglesia'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[iglesiaInstance: iglesiaInstance]
	}

	def edit() {
		def iglesiaInstance = Iglesia.get(params.id)
		if (!iglesiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'iglesia.label', default: 'Iglesia'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[iglesiaInstance: iglesiaInstance]
	}

	def update() {
		def iglesiaInstance = Iglesia.get(params.id)
		if (!iglesiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'iglesia.label', default: 'Iglesia'),
				params.id
			])
			redirect(action: "list")
			return
		}

		if (params.version) {
			def version = params.version.toLong()
			if (iglesiaInstance.version > version) {
				iglesiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'iglesia.label', default: 'Iglesia')]
						as Object[],
						"Another user has updated this Iglesia while you were editing")
				render(view: "edit", model: [iglesiaInstance: iglesiaInstance])
				return
			}
		}

		iglesiaInstance.properties = params

		if (!iglesiaInstance.save(flush: true)) {
			render(view: "edit", model: [iglesiaInstance: iglesiaInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'iglesia.label', default: 'Iglesia'),
			iglesiaInstance.id
		])
		redirect(action: "show", id: iglesiaInstance.id)
	}

	def delete() {
		def iglesiaInstance = Iglesia.get(params.id)
		if (!iglesiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'iglesia.label', default: 'Iglesia'),
				params.id
			])
			redirect(action: "list")
			return
		}

		try {
			iglesiaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'iglesia.label', default: 'Iglesia'),
				params.id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'iglesia.label', default: 'Iglesia'),
				params.id
			])
			redirect(action: "show", id: params.id)
		}
	}
}
