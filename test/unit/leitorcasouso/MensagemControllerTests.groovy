package leitorcasouso



import org.junit.*
import grails.test.mixin.*

@TestFor(MensagemController)
@Mock(Mensagem)
class MensagemControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/mensagem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.mensagemInstanceList.size() == 0
        assert model.mensagemInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.mensagemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.mensagemInstance != null
        assert view == '/mensagem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/mensagem/show/1'
        assert controller.flash.message != null
        assert Mensagem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/mensagem/list'

        populateValidParams(params)
        def mensagem = new Mensagem(params)

        assert mensagem.save() != null

        params.id = mensagem.id

        def model = controller.show()

        assert model.mensagemInstance == mensagem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/mensagem/list'

        populateValidParams(params)
        def mensagem = new Mensagem(params)

        assert mensagem.save() != null

        params.id = mensagem.id

        def model = controller.edit()

        assert model.mensagemInstance == mensagem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/mensagem/list'

        response.reset()

        populateValidParams(params)
        def mensagem = new Mensagem(params)

        assert mensagem.save() != null

        // test invalid parameters in update
        params.id = mensagem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/mensagem/edit"
        assert model.mensagemInstance != null

        mensagem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/mensagem/show/$mensagem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        mensagem.clearErrors()

        populateValidParams(params)
        params.id = mensagem.id
        params.version = -1
        controller.update()

        assert view == "/mensagem/edit"
        assert model.mensagemInstance != null
        assert model.mensagemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/mensagem/list'

        response.reset()

        populateValidParams(params)
        def mensagem = new Mensagem(params)

        assert mensagem.save() != null
        assert Mensagem.count() == 1

        params.id = mensagem.id

        controller.delete()

        assert Mensagem.count() == 0
        assert Mensagem.get(mensagem.id) == null
        assert response.redirectedUrl == '/mensagem/list'
    }
}
