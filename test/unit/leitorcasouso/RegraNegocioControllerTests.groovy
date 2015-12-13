package leitorcasouso



import org.junit.*
import grails.test.mixin.*

@TestFor(RegraNegocioController)
@Mock(RegraNegocio)
class RegraNegocioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/regraNegocio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.regraNegocioInstanceList.size() == 0
        assert model.regraNegocioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.regraNegocioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.regraNegocioInstance != null
        assert view == '/regraNegocio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/regraNegocio/show/1'
        assert controller.flash.message != null
        assert RegraNegocio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/regraNegocio/list'

        populateValidParams(params)
        def regraNegocio = new RegraNegocio(params)

        assert regraNegocio.save() != null

        params.id = regraNegocio.id

        def model = controller.show()

        assert model.regraNegocioInstance == regraNegocio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/regraNegocio/list'

        populateValidParams(params)
        def regraNegocio = new RegraNegocio(params)

        assert regraNegocio.save() != null

        params.id = regraNegocio.id

        def model = controller.edit()

        assert model.regraNegocioInstance == regraNegocio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/regraNegocio/list'

        response.reset()

        populateValidParams(params)
        def regraNegocio = new RegraNegocio(params)

        assert regraNegocio.save() != null

        // test invalid parameters in update
        params.id = regraNegocio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/regraNegocio/edit"
        assert model.regraNegocioInstance != null

        regraNegocio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/regraNegocio/show/$regraNegocio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        regraNegocio.clearErrors()

        populateValidParams(params)
        params.id = regraNegocio.id
        params.version = -1
        controller.update()

        assert view == "/regraNegocio/edit"
        assert model.regraNegocioInstance != null
        assert model.regraNegocioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/regraNegocio/list'

        response.reset()

        populateValidParams(params)
        def regraNegocio = new RegraNegocio(params)

        assert regraNegocio.save() != null
        assert RegraNegocio.count() == 1

        params.id = regraNegocio.id

        controller.delete()

        assert RegraNegocio.count() == 0
        assert RegraNegocio.get(regraNegocio.id) == null
        assert response.redirectedUrl == '/regraNegocio/list'
    }
}
