package leitorcasouso

import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

class CasoDeUsoController {
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def casoUsoService
    def filterPaneService

    def index() {
        redirect(action: "list", params: params)
    }

    def filter(Integer max) {
        return list(max)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def filterParams = FilterPaneUtils.extractFilterParams(params);
        filterParams.putAll([max: params?.max, offset: params?.offset, query: params?.query]);

        def casoDeUsoInstanceList = []
        def casoDeUsoInstanceTotal = 0

        if(params?.query?.trim()){

        }else{
            casoDeUsoInstanceList = filterPaneService.filter( params, CasoDeUso )
            casoDeUsoInstanceTotal = filterPaneService.count( params, CasoDeUso )
        }

        render(view: "list", model: [casoDeUsoInstanceList: casoDeUsoInstanceList, params:params,
                casoDeUsoInstanceTotal: casoDeUsoInstanceTotal, filterParams: filterParams])
    }

    def create() {
        [casoDeUsoInstance: new CasoDeUso(params)]
    }

    def save() {
        def casoDeUsoInstance = new CasoDeUso(params)
        if (!casoDeUsoInstance.save(flush: true)) {
            render(view: "create", model: [casoDeUsoInstance: casoDeUsoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'casoDeUso.label', default: 'CasoDeUso'), casoDeUsoInstance.id])
        redirect(action: "show", id: casoDeUsoInstance.id)
    }

    def show(Long id) {
        def casoDeUsoInstance = CasoDeUso.get(id)
        if (!casoDeUsoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'casoDeUso.label', default: 'CasoDeUso'), id])
            redirect(action: "list")
            return
        }

        [casoDeUsoInstance: casoDeUsoInstance]
    }

    def edit(Long id) {
        def casoDeUsoInstance = CasoDeUso.get(id)
        if (!casoDeUsoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'casoDeUso.label', default: 'CasoDeUso'), id])
            redirect(action: "list")
            return
        }

        [casoDeUsoInstance: casoDeUsoInstance]
    }

    def update(Long id, Long version) {
        def casoDeUsoInstance = CasoDeUso.get(id)
        if (!casoDeUsoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'casoDeUso.label', default: 'CasoDeUso'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (casoDeUsoInstance.version > version) {
                casoDeUsoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'casoDeUso.label', default: 'CasoDeUso')] as Object[],
                          "Another user has updated this CasoDeUso while you were editing")
                render(view: "edit", model: [casoDeUsoInstance: casoDeUsoInstance])
                return
            }
        }

        casoDeUsoInstance.fluxosAlternativos.clear()
        casoDeUsoInstance.fluxosExcecao.clear()
        casoDeUsoInstance.properties = params

        casoUsoService.trateMensagensERegrasNegocio(casoDeUsoInstance)

        if (!casoDeUsoInstance.save(flush: true)) {
            render(view: "edit", model: [casoDeUsoInstance: casoDeUsoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'casoDeUso.label', default: 'CasoDeUso'), casoDeUsoInstance.id])
        redirect(action: "show", id: casoDeUsoInstance.id)
    }

    def delete(Long id) {
        def casoDeUsoInstance = CasoDeUso.get(id)
        if (!casoDeUsoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'casoDeUso.label', default: 'CasoDeUso'), id])
            redirect(action: "list")
            return
        }

        try {
            casoDeUsoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'casoDeUso.label', default: 'CasoDeUso'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'casoDeUso.label', default: 'CasoDeUso'), id])
            redirect(action: "show", id: id)
        }
    }
}
