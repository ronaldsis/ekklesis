package org.ekklesis

import org.springframework.dao.DataIntegrityViolationException

class MiembroFamiliaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [miembroFamiliaInstanceList: MiembroFamilia.list(params), miembroFamiliaInstanceTotal: MiembroFamilia.count()]
    }

    def create() {
        [miembroFamiliaInstance: new MiembroFamilia(params)]
    }

    def save() {
        def miembroFamiliaInstance = new MiembroFamilia(params)
        if (!miembroFamiliaInstance.save(flush: true)) {
            render(view: "create", model: [miembroFamiliaInstance: miembroFamiliaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'miembroFamilia.label', default: 'MiembroFamilia'), miembroFamiliaInstance.id])
        redirect(action: "show", id: miembroFamiliaInstance.id)
    }

    def show() {
        def miembroFamiliaInstance = MiembroFamilia.get(params.id)
        if (!miembroFamiliaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'miembroFamilia.label', default: 'MiembroFamilia'), params.id])
            redirect(action: "list")
            return
        }

        [miembroFamiliaInstance: miembroFamiliaInstance]
    }

    def edit() {
        def miembroFamiliaInstance = MiembroFamilia.get(params.id)
        if (!miembroFamiliaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'miembroFamilia.label', default: 'MiembroFamilia'), params.id])
            redirect(action: "list")
            return
        }

        [miembroFamiliaInstance: miembroFamiliaInstance]
    }

    def update() {
        def miembroFamiliaInstance = MiembroFamilia.get(params.id)
        if (!miembroFamiliaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'miembroFamilia.label', default: 'MiembroFamilia'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (miembroFamiliaInstance.version > version) {
                miembroFamiliaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'miembroFamilia.label', default: 'MiembroFamilia')] as Object[],
                          "Another user has updated this MiembroFamilia while you were editing")
                render(view: "edit", model: [miembroFamiliaInstance: miembroFamiliaInstance])
                return
            }
        }

        miembroFamiliaInstance.properties = params

        if (!miembroFamiliaInstance.save(flush: true)) {
            render(view: "edit", model: [miembroFamiliaInstance: miembroFamiliaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'miembroFamilia.label', default: 'MiembroFamilia'), miembroFamiliaInstance.id])
        redirect(action: "show", id: miembroFamiliaInstance.id)
    }

    def delete() {
        def miembroFamiliaInstance = MiembroFamilia.get(params.id)
        if (!miembroFamiliaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'miembroFamilia.label', default: 'MiembroFamilia'), params.id])
            redirect(action: "list")
            return
        }

        try {
            miembroFamiliaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'miembroFamilia.label', default: 'MiembroFamilia'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'miembroFamilia.label', default: 'MiembroFamilia'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
