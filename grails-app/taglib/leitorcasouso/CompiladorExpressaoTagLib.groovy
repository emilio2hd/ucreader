package leitorcasouso

class CompiladorExpressaoTagLib {
    static namespace = "compilador"
    def regraNegocioService
    def casoUsoService

    def compileMensagem = { attrs, body ->

        def codigos = regraNegocioService.obtenhaCodigoDeMensagens(attrs.descricao)
        def mensages = attrs.mensagens as List<Mensagem>

        codigos.each {String codigo ->
            def mensagem = mensages.find { it.codigo == codigo }
            if(mensagem){
                def link = """
                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="right" title="${mensagem.descricao}">
                    [${mensagem.codigo}]</a>
                """
                attrs.descricao = attrs.descricao.replace("[m(${mensagem.codigo})]", link)
            }
        }

        out << attrs.descricao
    }

    def compileFluxo = { attrs, body ->
        def casoUso = attrs.casoUso as CasoDeUso
        def fluxo = attrs.fluxo as Fluxo

        def codigos = regraNegocioService.obtenhaCodigoDeMensagens(fluxo.descricao)

        codigos.each {String codigo ->
            def mensagem = casoUso.mensagens.find { it.codigo == codigo }
            if(mensagem){
                def link = """
                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="right" title="${mensagem.descricao}">
                    [${mensagem.codigo}]</a>
                """
                fluxo.descricao = fluxo.descricao.replace("[m(${mensagem.codigo})]", link)
            }
        }

        def codigosRegras = casoUsoService.obtenhaCodigosRegrasNegocio(fluxo.descricao)
        codigosRegras.each {String codigoRegra ->
            def regra = casoUso.regrasNegocio.find { it.codigo == codigoRegra }
            if(regra){
                def url = g.createLink(controller: 'regraNegocio', action: 'detalhar', id: regra.id)
                def link = """<a data-toggle="modal" title="${regra.titulo}" href="${url}" data-target="#modal">[${regra.codigo}]</a>"""
                fluxo.descricao = fluxo.descricao.replace("[r(${regra.codigo})]", link)
            }
        }

        out << fluxo.descricao
    }
}
