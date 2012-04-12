package org.ekklesis

import org.springframework.dao.DataIntegrityViolationException

class RolGrupoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [rolGrupoInstanceList: RolGrupo.list(params), rolGrupoInstanceTotal: RolGrupo.count()]
    }

    def create() {
        [rolGrupoInstance: new RolGrupo(params)]
    }

    def save() {
        def rolGrupoInstance = new RolGrupo(params)
        if (!rolGrupoInstance.save(flush: true)) {
            render(view: "create", model: [rolGrupoInstance: rolGrupoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'rolGrupo.label', default: 'RolGrupo'), rolGrupoInstance.id])
        redirect(action: "show", id: rolGrupoInstance.id)
    }

    def show() {
        def rolGrupoInstance = RolGrupo.get(params.id)
        if (!rolGrupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'rolGrupo.label', default: 'RolGrupo'), params.id])
            redirect(action: "list")
            return
        }

        [rolGrupoInstance: rolGrupoInstance]
    }

    def edit() {
        def rolGrupoInstance = RolGrupo.get(params.id)
        if (!rolGrupoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rolGrupo.label', default: 'RolGrupo'), params.id])
            redirect(action: "list")
            return
        }

        [rolGrupoInstance: rolGrupoInstance]
    }

    def update() {
        def rolGrupoInstance = RolGrupo.get(params.id)
        if (!rolGrupoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rolGrupo.label', default: 'RolGrupo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (rolGrupoInstance.version > version) {
                rolGrupoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'rolGrupo.label', default: 'RolGrupo')] as Object[],
                          "Another user has updated this RolGrupo while you were editing")
                render(view: "edit", model: [rolGrupoInstance: rolGrupoInstance])
                return
            }
        }

        rolGrupoInstance.properties = params

        if (!rolGrupoInstance.save(flush: true)) {
            render(view: "edit", model: [rolGrupoInstance: rolGrupoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'rolGrupo.label', default: 'RolGrupo'), rolGrupoInstance.id])
        redirect(action: "show", id: rolGrupoInstance.id)
    }

    def delete() {
        def rolGrupoInstance = RolGrupo.get(params.id)
        if (!rolGrupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'rolGrupo.label', default: 'RolGrupo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            rolGrupoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'rolGrupo.label', default: 'RolGrupo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'rolGrupo.label', default: 'RolGrupo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
