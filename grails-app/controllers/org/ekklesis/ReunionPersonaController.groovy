package org.ekklesis

import org.springframework.dao.DataIntegrityViolationException

class ReunionPersonaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reunionPersonaInstanceList: ReunionPersona.list(params), reunionPersonaInstanceTotal: ReunionPersona.count()]
    }

    def create() {
        [reunionPersonaInstance: new ReunionPersona(params)]
    }

    def save() {
        def reunionPersonaInstance = new ReunionPersona(params)
        if (!reunionPersonaInstance.save(flush: true)) {
            render(view: "create", model: [reunionPersonaInstance: reunionPersonaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'reunionPersona.label', default: 'ReunionPersona'), reunionPersonaInstance.id])
        redirect(action: "show", id: reunionPersonaInstance.id)
    }

    def show() {
        def reunionPersonaInstance = ReunionPersona.get(params.id)
        if (!reunionPersonaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'reunionPersona.label', default: 'ReunionPersona'), params.id])
            redirect(action: "list")
            return
        }

        [reunionPersonaInstance: reunionPersonaInstance]
    }

    def edit() {
        def reunionPersonaInstance = ReunionPersona.get(params.id)
        if (!reunionPersonaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reunionPersona.label', default: 'ReunionPersona'), params.id])
            redirect(action: "list")
            return
        }

        [reunionPersonaInstance: reunionPersonaInstance]
    }

    def update() {
        def reunionPersonaInstance = ReunionPersona.get(params.id)
        if (!reunionPersonaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reunionPersona.label', default: 'ReunionPersona'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (reunionPersonaInstance.version > version) {
                reunionPersonaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reunionPersona.label', default: 'ReunionPersona')] as Object[],
                          "Another user has updated this ReunionPersona while you were editing")
                render(view: "edit", model: [reunionPersonaInstance: reunionPersonaInstance])
                return
            }
        }

        reunionPersonaInstance.properties = params

        if (!reunionPersonaInstance.save(flush: true)) {
            render(view: "edit", model: [reunionPersonaInstance: reunionPersonaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'reunionPersona.label', default: 'ReunionPersona'), reunionPersonaInstance.id])
        redirect(action: "show", id: reunionPersonaInstance.id)
    }

    def delete() {
        def reunionPersonaInstance = ReunionPersona.get(params.id)
        if (!reunionPersonaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'reunionPersona.label', default: 'ReunionPersona'), params.id])
            redirect(action: "list")
            return
        }

        try {
            reunionPersonaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'reunionPersona.label', default: 'ReunionPersona'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reunionPersona.label', default: 'ReunionPersona'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
