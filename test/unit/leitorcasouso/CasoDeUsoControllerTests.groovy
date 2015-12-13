package leitorcasouso



import org.junit.*
import grails.test.mixin.*

@TestFor(CasoDeUsoController)
@Mock(CasoDeUso)
class CasoDeUsoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/casoDeUso/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.casoDeUsoInstanceList.size() == 0
        assert model.casoDeUsoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.casoDeUsoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.casoDeUsoInstance != null
        assert view == '/casoDeUso/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/casoDeUso/show/1'
        assert controller.flash.message != null
        assert CasoDeUso.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/casoDeUso/list'

        populateValidParams(params)
        def casoDeUso = new CasoDeUso(params)

        assert casoDeUso.save() != null

        params.id = casoDeUso.id

        def model = controller.show()

        assert model.casoDeUsoInstance == casoDeUso
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/casoDeUso/list'

        populateValidParams(params)
        def casoDeUso = new CasoDeUso(params)

        assert casoDeUso.save() != null

        params.id = casoDeUso.id

        def model = controller.edit()

        assert model.casoDeUsoInstance == casoDeUso
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/casoDeUso/list'

        response.reset()

        populateValidParams(params)
        def casoDeUso = new CasoDeUso(params)

        assert casoDeUso.save() != null

        // test invalid parameters in update
        params.id = casoDeUso.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/casoDeUso/edit"
        assert model.casoDeUsoInstance != null

        casoDeUso.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/casoDeUso/show/$casoDeUso.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        casoDeUso.clearErrors()

        populateValidParams(params)
        params.id = casoDeUso.id
        params.version = -1
        controller.update()

        assert view == "/casoDeUso/edit"
        assert model.casoDeUsoInstance != null
        assert model.casoDeUsoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/casoDeUso/list'

        response.reset()

        populateValidParams(params)
        def casoDeUso = new CasoDeUso(params)

        assert casoDeUso.save() != null
        assert CasoDeUso.count() == 1

        params.id = casoDeUso.id

        controller.delete()

        assert CasoDeUso.count() == 0
        assert CasoDeUso.get(casoDeUso.id) == null
        assert response.redirectedUrl == '/casoDeUso/list'
    }
}
