package org.ekklesis

import org.springframework.dao.DataIntegrityViolationException

class ClasificacionPersonaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [clasificacionPersonaInstanceList: ClasificacionPersona.list(params), clasificacionPersonaInstanceTotal: ClasificacionPersona.count()]
    }

    def create() {
        [clasificacionPersonaInstance: new ClasificacionPersona(params)]
    }

    def save() {
        def clasificacionPersonaInstance = new ClasificacionPersona(params)
        if (!clasificacionPersonaInstance.save(flush: true)) {
            render(view: "create", model: [clasificacionPersonaInstance: clasificacionPersonaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'clasificacionPersona.label', default: 'ClasificacionPersona'), clasificacionPersonaInstance.id])
        redirect(action: "show", id: clasificacionPersonaInstance.id)
    }

    def show() {
        def clasificacionPersonaInstance = ClasificacionPersona.get(params.id)
        if (!clasificacionPersonaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'clasificacionPersona.label', default: 'ClasificacionPersona'), params.id])
            redirect(action: "list")
            return
        }

        [clasificacionPersonaInstance: clasificacionPersonaInstance]
    }

    def edit() {
        def clasificacionPersonaInstance = ClasificacionPersona.get(params.id)
        if (!clasificacionPersonaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clasificacionPersona.label', default: 'ClasificacionPersona'), params.id])
            redirect(action: "list")
            return
        }

        [clasificacionPersonaInstance: clasificacionPersonaInstance]
    }

    def update() {
        def clasificacionPersonaInstance = ClasificacionPersona.get(params.id)
        if (!clasificacionPersonaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'clasificacionPersona.label', default: 'ClasificacionPersona'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (clasificacionPersonaInstance.version > version) {
                clasificacionPersonaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'clasificacionPersona.label', default: 'ClasificacionPersona')] as Object[],
                          "Another user has updated this ClasificacionPersona while you were editing")
                render(view: "edit", model: [clasificacionPersonaInstance: clasificacionPersonaInstance])
                return
            }
        }

        clasificacionPersonaInstance.properties = params

        if (!clasificacionPersonaInstance.save(flush: true)) {
            render(view: "edit", model: [clasificacionPersonaInstance: clasificacionPersonaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'clasificacionPersona.label', default: 'ClasificacionPersona'), clasificacionPersonaInstance.id])
        redirect(action: "show", id: clasificacionPersonaInstance.id)
    }

    def delete() {
        def clasificacionPersonaInstance = ClasificacionPersona.get(params.id)
        if (!clasificacionPersonaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'clasificacionPersona.label', default: 'ClasificacionPersona'), params.id])
            redirect(action: "list")
            return
        }

        try {
            clasificacionPersonaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'clasificacionPersona.label', default: 'ClasificacionPersona'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'clasificacionPersona.label', default: 'ClasificacionPersona'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
