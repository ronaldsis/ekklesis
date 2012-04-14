package org.ekklesis



import org.junit.*
import grails.test.mixin.*

@TestFor(AsistenciaPersonaController)
@Mock(AsistenciaPersona)
class AsistenciaPersonaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/asistenciaPersona/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.asistenciaPersonaInstanceList.size() == 0
        assert model.asistenciaPersonaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.asistenciaPersonaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.asistenciaPersonaInstance != null
        assert view == '/asistenciaPersona/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/asistenciaPersona/show/1'
        assert controller.flash.message != null
        assert AsistenciaPersona.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/asistenciaPersona/list'


        populateValidParams(params)
        def asistenciaPersona = new AsistenciaPersona(params)

        assert asistenciaPersona.save() != null

        params.id = asistenciaPersona.id

        def model = controller.show()

        assert model.asistenciaPersonaInstance == asistenciaPersona
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/asistenciaPersona/list'


        populateValidParams(params)
        def asistenciaPersona = new AsistenciaPersona(params)

        assert asistenciaPersona.save() != null

        params.id = asistenciaPersona.id

        def model = controller.edit()

        assert model.asistenciaPersonaInstance == asistenciaPersona
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/asistenciaPersona/list'

        response.reset()


        populateValidParams(params)
        def asistenciaPersona = new AsistenciaPersona(params)

        assert asistenciaPersona.save() != null

        // test invalid parameters in update
        params.id = asistenciaPersona.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/asistenciaPersona/edit"
        assert model.asistenciaPersonaInstance != null

        asistenciaPersona.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/asistenciaPersona/show/$asistenciaPersona.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        asistenciaPersona.clearErrors()

        populateValidParams(params)
        params.id = asistenciaPersona.id
        params.version = -1
        controller.update()

        assert view == "/asistenciaPersona/edit"
        assert model.asistenciaPersonaInstance != null
        assert model.asistenciaPersonaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/asistenciaPersona/list'

        response.reset()

        populateValidParams(params)
        def asistenciaPersona = new AsistenciaPersona(params)

        assert asistenciaPersona.save() != null
        assert AsistenciaPersona.count() == 1

        params.id = asistenciaPersona.id

        controller.delete()

        assert AsistenciaPersona.count() == 0
        assert AsistenciaPersona.get(asistenciaPersona.id) == null
        assert response.redirectedUrl == '/asistenciaPersona/list'
    }
}
