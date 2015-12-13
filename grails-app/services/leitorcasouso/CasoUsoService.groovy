package leitorcasouso

class CasoUsoService {
    private static final EMPRESSAO_REGULAR_PARA_REGRA_NEGOCIO = /\[r\(([^\)]+)\)\]/ // Casa com [r(RN.12)]
    private static final EMPRESSAO_REGULAR_PARA_MENSAGEM = /\[m\(([^\)]+)\)\]/ // Casa com [m(MA0001)]

    void trateMensagensERegrasNegocio(CasoDeUso casoDeUso) {
        def mensagens = pesquisaMensagens(casoDeUso.fluxoPrincipal.descricao)

        casoDeUso.mensagens.clear()
        mensagens.each { casoDeUso.addToMensagens(it) }

        casoDeUso.regrasNegocio.clear()
        def regras = pesquisaRegraNegocio(casoDeUso.fluxoPrincipal.descricao)
        regras.each { casoDeUso.addToRegrasNegocio(it) }

        casoDeUso?.fluxosAlternativos?.each {
            pesquisaMensagens(it.descricao).each { casoDeUso.addToMensagens(it) }
            pesquisaRegraNegocio(it.descricao).each { casoDeUso.addToRegrasNegocio(it) }
        }

        casoDeUso?.fluxosExcecao?.each {
            pesquisaMensagens(it.descricao).each { casoDeUso.addToMensagens(it) }
            pesquisaRegraNegocio(it.descricao).each { casoDeUso.addToRegrasNegocio(it) }
        }
    }

    List<RegraNegocio> pesquisaRegraNegocio(String descricao){
        def codigosEncontrados = obtenhaCodigosRegrasNegocio(descricao)

        if(codigosEncontrados.empty){
            return []
        }

        return RegraNegocio.withCriteria {
            'in' 'codigo', codigosEncontrados
        }
    }

    List<Mensagem> pesquisaMensagens(String descricao){
        def codigosEncontrados = obtenhaCodigoDeMensagens(descricao)

        if(codigosEncontrados.empty){
            return []
        }

        return Mensagem.withCriteria {
            'in' 'codigo', codigosEncontrados
        }
    }

    List<String> obtenhaCodigoDeMensagens(String conteudo){
        def encontrados = conteudo =~ EMPRESSAO_REGULAR_PARA_MENSAGEM
        return encontrados.collect{ it[1] } as List<String>
    }

    List<String> obtenhaCodigosRegrasNegocio(String conteudo){
        def encontrados = conteudo =~ EMPRESSAO_REGULAR_PARA_REGRA_NEGOCIO
        return encontrados.collect{ it[1] } as List<String>
    }
}
