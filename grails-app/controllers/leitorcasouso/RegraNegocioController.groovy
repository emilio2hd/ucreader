package leitorcasouso

import org.grails.plugin.filterpane.FilterPaneUtils
import org.hibernate.criterion.CriteriaSpecification
import org.springframework.dao.DataIntegrityViolationException

class RegraNegocioController {
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def regraNegocioService
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

        def regraNegocioInstanceList = []
        def regraNegocioInstanceTotal = 0

        if(params?.query?.trim()){
            def filtro = {
                createAlias('mensagens', 'mensagens', CriteriaSpecification.LEFT_JOIN)

                or{
                    like 'codigo', "%${params.query}%"
                    like 'titulo', "%${params.query}%"
                    like 'descricao', "%${params.query}%"
                    like 'mensagens.descricao', "%${params.query}%"
                    like 'mensagens.codigo', "%${params.query}%"
                }
            }

            regraNegocioInstanceList = RegraNegocio.createCriteria().list(filtro)
            regraNegocioInstanceTotal = RegraNegocio.createCriteria().get {
                filtro.delegate = delegate
                filtro()
                projections {
                    rowCount()
                }
            }
        }else{
            regraNegocioInstanceList = filterPaneService.filter( params, RegraNegocio )
            regraNegocioInstanceTotal = filterPaneService.count( params, RegraNegocio )
        }

        render(view: "list", model: [regraNegocioInstanceList: regraNegocioInstanceList, params:params,
                regraNegocioInstanceTotal: regraNegocioInstanceTotal, filterParams: filterParams])
    }

    def create() {
        [regraNegocioInstance: new RegraNegocio(params)]
    }

    def save() {
        def regraNegocioInstance = new RegraNegocio(params)

        regraNegocioService.trateMensagens(regraNegocioInstance)

        regraNegocioInstance.codigo = regraNegocioInstance?.codigo?.trim()
        regraNegocioInstance.titulo = regraNegocioInstance?.titulo?.trim()

        if (!regraNegocioInstance.save(flush: true)) {
            render(view: "create", model: [regraNegocioInstance: regraNegocioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'regraNegocio.label', default: 'RegraNegocio'), regraNegocioInstance.id])
        redirect(action: "show", id: regraNegocioInstance.id)
    }

    def show(Long id) {
        def regraNegocioInstance = RegraNegocio.get(id)
        if (!regraNegocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regraNegocio.label', default: 'RegraNegocio'), id])
            redirect(action: "list")
            return
        }

        [regraNegocioInstance: regraNegocioInstance]
    }

    def edit(Long id) {
        def regraNegocioInstance = RegraNegocio.get(id)
        if (!regraNegocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regraNegocio.label', default: 'RegraNegocio'), id])
            redirect(action: "list")
            return
        }

        [regraNegocioInstance: regraNegocioInstance]
    }

    def update(Long id, Long version) {
        def regraNegocioInstance = RegraNegocio.get(id)
        if (!regraNegocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regraNegocio.label', default: 'RegraNegocio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (regraNegocioInstance.version > version) {
                regraNegocioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'regraNegocio.label', default: 'RegraNegocio')] as Object[],
                        "Another user has updated this RegraNegocio while you were editing")
                render(view: "edit", model: [regraNegocioInstance: regraNegocioInstance])
                return
            }
        }

        regraNegocioInstance.properties = params

        regraNegocioService.trateMensagens(regraNegocioInstance)

        regraNegocioInstance.codigo = regraNegocioInstance?.codigo?.trim()
        regraNegocioInstance.titulo = regraNegocioInstance?.titulo?.trim()

        if (!regraNegocioInstance.save(flush: true)) {
            render(view: "edit", model: [regraNegocioInstance: regraNegocioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'regraNegocio.label', default: 'RegraNegocio'), regraNegocioInstance.id])
        redirect(action: "show", id: regraNegocioInstance.id)
    }

    def delete(Long id) {
        def regraNegocioInstance = RegraNegocio.get(id)
        if (!regraNegocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regraNegocio.label', default: 'RegraNegocio'), id])
            redirect(action: "list")
            return
        }

        try {
            regraNegocioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'regraNegocio.label', default: 'RegraNegocio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'regraNegocio.label', default: 'RegraNegocio'), id])
            redirect(action: "show", id: id)
        }
    }

    def detalhar(Long id){
        def regraNegocioInstance = RegraNegocio.get(id)
        if (!regraNegocioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regraNegocio.label', default: 'RegraNegocio'), id])
            redirect(action: "list")
            return
        }

        render(template:'detalhar', model: [regraNegocioInstance: regraNegocioInstance])
    }
}
