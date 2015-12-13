package leitorcasouso



import grails.test.mixin.*
import org.junit.*

@TestFor(RegraNegocioService)
class RegraNegocioServiceTests {
    def regraNegocioService

    void testSomething() {
        regraNegocioService = new RegraNegocioService()

        def regraNegocio = new RegraNegocio()
        def params = [:]
        regraNegocio.descricao = """ teste com [m(RN86.10)] que  altera uma coisa
uma alternativa ao [m(RN86.11)],[m(RN86.10 )] outro teste vai pra lá
        """
        def mensagens = regraNegocioService.trateMensagens(regraNegocio, params)
        assertEquals 3, mensagens.size()
    }
}
