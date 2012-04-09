package org.ekklesis

import org.springframework.dao.DataIntegrityViolationException

class FamiliaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [familiaInstanceList: Familia.list(params), familiaInstanceTotal: Familia.count()]
    }

    def create() {
        [familiaInstance: new Familia(params)]
    }

    def save() {
        def familiaInstance = new Familia(params)
        if (!familiaInstance.save(flush: true)) {
            render(view: "create", model: [familiaInstance: familiaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'familia.label', default: 'Familia'), familiaInstance.id])
        redirect(action: "show", id: familiaInstance.id)
    }

    def show() {
        def familiaInstance = Familia.get(params.id)
        if (!familiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'familia.label', default: 'Familia'), params.id])
            redirect(action: "list")
            return
        }

        [familiaInstance: familiaInstance]
    }

    def edit() {
        def familiaInstance = Familia.get(params.id)
        if (!familiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'familia.label', default: 'Familia'), params.id])
            redirect(action: "list")
            return
        }

        [familiaInstance: familiaInstance]
    }

    def update() {
        def familiaInstance = Familia.get(params.id)
        if (!familiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'familia.label', default: 'Familia'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (familiaInstance.version > version) {
                familiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'familia.label', default: 'Familia')] as Object[],
                          "Another user has updated this Familia while you were editing")
                render(view: "edit", model: [familiaInstance: familiaInstance])
                return
            }
        }

        familiaInstance.properties = params

        if (!familiaInstance.save(flush: true)) {
            render(view: "edit", model: [familiaInstance: familiaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'familia.label', default: 'Familia'), familiaInstance.id])
        redirect(action: "show", id: familiaInstance.id)
    }

    def delete() {
        def familiaInstance = Familia.get(params.id)
        if (!familiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'familia.label', default: 'Familia'), params.id])
            redirect(action: "list")
            return
        }

        try {
            familiaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'familia.label', default: 'Familia'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'familia.label', default: 'Familia'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
