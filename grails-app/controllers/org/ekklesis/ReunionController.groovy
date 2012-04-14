package org.ekklesis

import org.springframework.dao.DataIntegrityViolationException

class ReunionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reunionInstanceList: Reunion.list(params), reunionInstanceTotal: Reunion.count()]
    }

    def create() {
        [reunionInstance: new Reunion(params)]
    }

    def save() {
        def reunionInstance = new Reunion(params)
        if (!reunionInstance.save(flush: true)) {
            render(view: "create", model: [reunionInstance: reunionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'reunion.label', default: 'Reunion'), reunionInstance.id])
        redirect(action: "show", id: reunionInstance.id)
    }

    def show() {
        def reunionInstance = Reunion.get(params.id)
        if (!reunionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'reunion.label', default: 'Reunion'), params.id])
            redirect(action: "list")
            return
        }

        [reunionInstance: reunionInstance]
    }

    def edit() {
        def reunionInstance = Reunion.get(params.id)
        if (!reunionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reunion.label', default: 'Reunion'), params.id])
            redirect(action: "list")
            return
        }

        [reunionInstance: reunionInstance]
    }

    def update() {
        def reunionInstance = Reunion.get(params.id)
        if (!reunionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reunion.label', default: 'Reunion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (reunionInstance.version > version) {
                reunionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reunion.label', default: 'Reunion')] as Object[],
                          "Another user has updated this Reunion while you were editing")
                render(view: "edit", model: [reunionInstance: reunionInstance])
                return
            }
        }

        reunionInstance.properties = params

        if (!reunionInstance.save(flush: true)) {
            render(view: "edit", model: [reunionInstance: reunionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'reunion.label', default: 'Reunion'), reunionInstance.id])
        redirect(action: "show", id: reunionInstance.id)
    }

    def delete() {
        def reunionInstance = Reunion.get(params.id)
        if (!reunionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'reunion.label', default: 'Reunion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            reunionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'reunion.label', default: 'Reunion'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reunion.label', default: 'Reunion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
