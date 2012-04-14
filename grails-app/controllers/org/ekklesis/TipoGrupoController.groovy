package org.ekklesis

import org.springframework.dao.DataIntegrityViolationException

class TipoGrupoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tipoGrupoInstanceList: TipoGrupo.list(params), tipoGrupoInstanceTotal: TipoGrupo.count()]
    }

    def create() {
        [tipoGrupoInstance: new TipoGrupo(params)]
    }

    def save() {
        def tipoGrupoInstance = new TipoGrupo(params)
        if (!tipoGrupoInstance.save(flush: true)) {
            render(view: "create", model: [tipoGrupoInstance: tipoGrupoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), tipoGrupoInstance.id])
        redirect(action: "show", id: tipoGrupoInstance.id)
    }

    def show() {
        def tipoGrupoInstance = TipoGrupo.get(params.id)
        if (!tipoGrupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), params.id])
            redirect(action: "list")
            return
        }

        [tipoGrupoInstance: tipoGrupoInstance]
    }

    def edit() {
        def tipoGrupoInstance = TipoGrupo.get(params.id)
        if (!tipoGrupoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), params.id])
            redirect(action: "list")
            return
        }

        [tipoGrupoInstance: tipoGrupoInstance]
    }

    def update() {
        def tipoGrupoInstance = TipoGrupo.get(params.id)
        if (!tipoGrupoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (tipoGrupoInstance.version > version) {
                tipoGrupoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoGrupo.label', default: 'TipoGrupo')] as Object[],
                          "Another user has updated this TipoGrupo while you were editing")
                render(view: "edit", model: [tipoGrupoInstance: tipoGrupoInstance])
                return
            }
        }

        tipoGrupoInstance.properties = params

        if (!tipoGrupoInstance.save(flush: true)) {
            render(view: "edit", model: [tipoGrupoInstance: tipoGrupoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), tipoGrupoInstance.id])
        redirect(action: "show", id: tipoGrupoInstance.id)
    }

    def delete() {
        def tipoGrupoInstance = TipoGrupo.get(params.id)
        if (!tipoGrupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            tipoGrupoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
