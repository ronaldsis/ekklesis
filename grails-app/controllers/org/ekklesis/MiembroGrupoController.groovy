package org.ekklesis

import org.springframework.dao.DataIntegrityViolationException

class MiembroGrupoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [miembroGrupoInstanceList: MiembroGrupo.list(params), miembroGrupoInstanceTotal: MiembroGrupo.count()]
    }

    def create() {
        [miembroGrupoInstance: new MiembroGrupo(params)]
    }

    def save() {
        def miembroGrupoInstance = new MiembroGrupo(params)
        if (!miembroGrupoInstance.save(flush: true)) {
            render(view: "create", model: [miembroGrupoInstance: miembroGrupoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'miembroGrupo.label', default: 'MiembroGrupo'), miembroGrupoInstance.id])
        redirect(action: "show", id: miembroGrupoInstance.id)
    }

    def show() {
        def miembroGrupoInstance = MiembroGrupo.get(params.id)
        if (!miembroGrupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'miembroGrupo.label', default: 'MiembroGrupo'), params.id])
            redirect(action: "list")
            return
        }

        [miembroGrupoInstance: miembroGrupoInstance]
    }

    def edit() {
        def miembroGrupoInstance = MiembroGrupo.get(params.id)
        if (!miembroGrupoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'miembroGrupo.label', default: 'MiembroGrupo'), params.id])
            redirect(action: "list")
            return
        }

        [miembroGrupoInstance: miembroGrupoInstance]
    }

    def update() {
        def miembroGrupoInstance = MiembroGrupo.get(params.id)
        if (!miembroGrupoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'miembroGrupo.label', default: 'MiembroGrupo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (miembroGrupoInstance.version > version) {
                miembroGrupoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'miembroGrupo.label', default: 'MiembroGrupo')] as Object[],
                          "Another user has updated this MiembroGrupo while you were editing")
                render(view: "edit", model: [miembroGrupoInstance: miembroGrupoInstance])
                return
            }
        }

        miembroGrupoInstance.properties = params

        if (!miembroGrupoInstance.save(flush: true)) {
            render(view: "edit", model: [miembroGrupoInstance: miembroGrupoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'miembroGrupo.label', default: 'MiembroGrupo'), miembroGrupoInstance.id])
        redirect(action: "show", id: miembroGrupoInstance.id)
    }

    def delete() {
        def miembroGrupoInstance = MiembroGrupo.get(params.id)
        if (!miembroGrupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'miembroGrupo.label', default: 'MiembroGrupo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            miembroGrupoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'miembroGrupo.label', default: 'MiembroGrupo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'miembroGrupo.label', default: 'MiembroGrupo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
