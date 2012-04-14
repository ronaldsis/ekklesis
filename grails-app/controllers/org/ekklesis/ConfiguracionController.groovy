package org.ekklesis

import org.springframework.dao.DataIntegrityViolationException

class ConfiguracionController {

    
    def index(){
        redirect(action: "list_estado", params: params)
    }
    
    /**
    * Funcionalidad para configurar el maestro de estados
    *
    */
    
    def index_estado() {
        redirect(action: "list_estado", params: params)
    }

    def list_estado() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [estadoInstanceList: Estado.list(params), estadoInstanceTotal: Estado.count()]
    }

    def create_estado() {
        [estadoInstance: new Estado(params)]
    }

    def save_estado() {
        def estadoInstance = new Estado(params)
        if (!estadoInstance.save(flush: true)) {
            render(view: "create_estado", model: [estadoInstance: estadoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'estado.label', default: 'Estado'), estadoInstance.id])
        redirect(action: "show_estado", id: estadoInstance.id)
    }

    def show_estado() {
        def estadoInstance = Estado.get(params.id)
        if (!estadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
            redirect(action: "list_estado")
            return
        }

        [estadoInstance: estadoInstance]
    }

    def edit_estado() {
        def estadoInstance = Estado.get(params.id)
        if (!estadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
            redirect(action: "list_estado")
            return
        }

        [estadoInstance: estadoInstance]
    }

    def update_estado() {
        def estadoInstance = Estado.get(params.id)
        if (!estadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
            redirect(action: "list_estado")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (estadoInstance.version > version) {
                estadoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'estado.label', default: 'Estado')] as Object[],
                          "Another user has updated this Estado while you were editing")
                render(view: "edit_estado", model: [estadoInstance: estadoInstance])
                return
            }
        }

        estadoInstance.properties = params

        if (!estadoInstance.save(flush: true)) {
            render(view: "edit_estado", model: [estadoInstance: estadoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'estado.label', default: 'Estado'), estadoInstance.id])
        redirect(action: "show_estado", id: estadoInstance.id)
    }

    def delete_estado() {
        def estadoInstance = Estado.get(params.id)
        if (!estadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
            redirect(action: "list_estado")
            return
        }

        try {
            estadoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
            redirect(action: "list_estado")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
            redirect(action: "show_estado", id: params.id)
        }
    }
    
    
    
    
    
    
    /**
    * Funcionalidad para configurar el maestro de estados
    *
    */
    
    def index_municipio() {
        redirect(action: "list_municipio", params: params)
    }

    def list_municipio() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [municipioInstanceList: Municipio.list(params), municipioInstanceTotal: Municipio.count()]
    }

    def create_municipio() {
        [municipioInstance: new Municipio(params)]
    }

    def save_municipio() {
        def municipioInstance = new Municipio(params)
        if (!municipioInstance.save(flush: true)) {
            render(view: "create_municipio", model: [municipioInstance: municipioInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'municipio.label', default: 'Municipio'), municipioInstance.id])
        redirect(action: "show_municipio", id: municipioInstance.id)
    }

    def show_municipio() {
        def municipioInstance = Municipio.get(params.id)
        if (!municipioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipio.label', default: 'Municipio'), params.id])
            redirect(action: "list_municipio")
            return
        }

        [municipioInstance: municipioInstance]
    }

    def edit_municipio() {
        def municipioInstance = Municipio.get(params.id)
        if (!municipioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipio.label', default: 'Municipio'), params.id])
            redirect(action: "list_municipio")
            return
        }

        [municipioInstance: municipioInstance]
    }

    def update_municipio() {
        def municipioInstance = Municipio.get(params.id)
        if (!municipioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipio.label', default: 'Municipio'), params.id])
            redirect(action: "list_municipio")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (municipioInstance.version > version) {
                municipioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'municipio.label', default: 'Municipio')] as Object[],
                          "Another user has updated this Municipio while you were editing")
                render(view: "edit_municipio", model: [municipioInstance: municipioInstance])
                return
            }
        }

        municipioInstance.properties = params

        if (!municipioInstance.save(flush: true)) {
            render(view: "edit_municipio", model: [municipioInstance: municipioInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'municipio.label', default: 'Municipio'), municipioInstance.id])
        redirect(action: "show_municipio", id: municipioInstance.id)
    }

    def delete_municipio() {
        def municipioInstance = Municipio.get(params.id)
        if (!municipioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipio.label', default: 'Municipio'), params.id])
            redirect(action: "list_municipio")
            return
        }

        try {
            municipioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'municipio.label', default: 'Municipio'), params.id])
            redirect(action: "list_municipio")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'municipio.label', default: 'Municipio'), params.id])
            redirect(action: "show_municipio", id: params.id)
        }
    }
    
    
    
    
    
    
    
    /**
    * Funcionalidad para configurar el maestro de tipos de grupo
    *
    */
    def index_tipoGrupo() {
        redirect(action: "list_tipoGrupo", params: params)
    }

    def list_tipoGrupo() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tipoGrupoInstanceList: TipoGrupo.list(params), tipoGrupoInstanceTotal: TipoGrupo.count()]
    }

    def create_tipoGrupo() {
        [tipoGrupoInstance: new TipoGrupo(params)]
    }

    def save_tipoGrupo() {
        def tipoGrupoInstance = new TipoGrupo(params)
        if (!tipoGrupoInstance.save(flush: true)) {
            render(view: "create_tipoGrupo", model: [tipoGrupoInstance: tipoGrupoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), tipoGrupoInstance.id])
        redirect(action: "show_tipoGrupo", id: tipoGrupoInstance.id)
    }

    def show_tipoGrupo() {
        def tipoGrupoInstance = TipoGrupo.get(params.id)
        if (!tipoGrupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), params.id])
            redirect(action: "list_tipoGrupo")
            return
        }

        [tipoGrupoInstance: tipoGrupoInstance]
    }

    def edit_tipoGrupo() {
        def tipoGrupoInstance = TipoGrupo.get(params.id)
        if (!tipoGrupoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), params.id])
            redirect(action: "list_tipoGrupo")
            return
        }

        [tipoGrupoInstance: tipoGrupoInstance]
    }

    def update_tipoGrupo() {
        def tipoGrupoInstance = TipoGrupo.get(params.id)
        if (!tipoGrupoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), params.id])
            redirect(action: "list_tipoGrupo")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (tipoGrupoInstance.version > version) {
                tipoGrupoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoGrupo.label', default: 'TipoGrupo')] as Object[],
                          "Another user has updated this TipoGrupo while you were editing")
                render(view: "edit_tipoGrupo", model: [tipoGrupoInstance: tipoGrupoInstance])
                return
            }
        }

        tipoGrupoInstance.properties = params

        if (!tipoGrupoInstance.save(flush: true)) {
            render(view: "edit_tipoGrupo", model: [tipoGrupoInstance: tipoGrupoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), tipoGrupoInstance.id])
        redirect(action: "show_tipoGrupo", id: tipoGrupoInstance.id)
    }

    def delete_tipoGrupo() {
        def tipoGrupoInstance = TipoGrupo.get(params.id)
        if (!tipoGrupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), params.id])
            redirect(action: "list_tipoGrupo")
            return
        }

        try {
            tipoGrupoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), params.id])
            redirect(action: "list_tipoGrupo")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoGrupo.label', default: 'TipoGrupo'), params.id])
            redirect(action: "show_tipoGrupo", id: params.id)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}
