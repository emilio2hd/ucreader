package leitorcasouso

import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

class MensagemController extends ControllerBasico{
    def filterPaneService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

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

        def mensagemInstanceList = []
        def mensagemInstanceTotal = 0

        if(params?.query?.trim()){
            def filtro = {
                or{
                    like 'descricao', "%${params.query}%"
                    like 'codigo', "%${params.query}%"
                }
            }

            mensagemInstanceList = Mensagem.createCriteria().list(filtro)
            mensagemInstanceTotal = Mensagem.createCriteria().get {
                filtro.delegate = delegate
                filtro()
                projections {
                    rowCount()
                }
            }
        }else{
            mensagemInstanceList = filterPaneService.filter( params, Mensagem )
            mensagemInstanceTotal = filterPaneService.count( params, Mensagem )
        }


        render(view: "list", model: [mensagemInstanceList: mensagemInstanceList, params:params,
                mensagemInstanceTotal: mensagemInstanceTotal, filterParams: filterParams])
    }

    def create() {
        [mensagemInstance: new Mensagem(params)]
    }

    def save() {
        def mensagemInstance = new Mensagem(params)

        mensagemInstance.codigo = mensagemInstance?.codigo?.trim()

        if (!mensagemInstance.save(flush: true)) {
            render(view: "create", model: [mensagemInstance: mensagemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), mensagemInstance.id])
        redirect(action: "show", id: mensagemInstance.id)
    }

    def show(Long id) {
        def mensagemInstance = Mensagem.get(id)
        if (!mensagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "list")
            return
        }

        [mensagemInstance: mensagemInstance]
    }

    def edit(Long id) {
        def mensagemInstance = Mensagem.get(id)
        if (!mensagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "list")
            return
        }

        [mensagemInstance: mensagemInstance]
    }

    def update(Long id, Long version) {
        def mensagemInstance = Mensagem.get(id)
        if (!mensagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (mensagemInstance.version > version) {
                mensagemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'mensagem.label', default: 'Mensagem')] as Object[],
                        "Another user has updated this Mensagem while you were editing")
                render(view: "edit", model: [mensagemInstance: mensagemInstance])
                return
            }
        }

        mensagemInstance.properties = params

        mensagemInstance.codigo = mensagemInstance?.codigo?.trim()

        if (!mensagemInstance.save(flush: true)) {
            render(view: "edit", model: [mensagemInstance: mensagemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), mensagemInstance.id])
        redirect(action: "show", id: mensagemInstance.id)
    }

    def delete(Long id) {
        def mensagemInstance = Mensagem.get(id)
        if (!mensagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "list")
            return
        }

        try {
            mensagemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mensagem.label', default: 'Mensagem'), id])
            redirect(action: "show", id: id)
        }
    }
}
