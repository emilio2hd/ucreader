package leitorcasouso

class RegraNegocioService {
    private static final EMPRESSAO_REGULAR_PARA_MENSAGEM = /\[m\(([^\)]+)\)\]/ // Casa com [m(MA0001)]

    void trateMensagens(RegraNegocio regraNegocio) {
        def codigosEncontrados = obtenhaCodigoDeMensagens(regraNegocio.descricao)

        if(codigosEncontrados.empty){
            return
        }

        def mensagens = Mensagem.withCriteria {
            'in' 'codigo', codigosEncontrados
        }

        regraNegocio.mensagens.clear()
        mensagens.each { regraNegocio.addToMensagens(it) }
    }

    List<String> obtenhaCodigoDeMensagens(String conteudo){
        def encontrados = conteudo =~ EMPRESSAO_REGULAR_PARA_MENSAGEM
        return encontrados.collect{ it[1] } as List<String>
    }
}
