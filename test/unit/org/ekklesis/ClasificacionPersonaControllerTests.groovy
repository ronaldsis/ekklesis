package org.ekklesis



import org.junit.*
import grails.test.mixin.*

@TestFor(ClasificacionPersonaController)
@Mock(ClasificacionPersona)
class ClasificacionPersonaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/clasificacionPersona/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.clasificacionPersonaInstanceList.size() == 0
        assert model.clasificacionPersonaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.clasificacionPersonaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.clasificacionPersonaInstance != null
        assert view == '/clasificacionPersona/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/clasificacionPersona/show/1'
        assert controller.flash.message != null
        assert ClasificacionPersona.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/clasificacionPersona/list'


        populateValidParams(params)
        def clasificacionPersona = new ClasificacionPersona(params)

        assert clasificacionPersona.save() != null

        params.id = clasificacionPersona.id

        def model = controller.show()

        assert model.clasificacionPersonaInstance == clasificacionPersona
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/clasificacionPersona/list'


        populateValidParams(params)
        def clasificacionPersona = new ClasificacionPersona(params)

        assert clasificacionPersona.save() != null

        params.id = clasificacionPersona.id

        def model = controller.edit()

        assert model.clasificacionPersonaInstance == clasificacionPersona
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/clasificacionPersona/list'

        response.reset()


        populateValidParams(params)
        def clasificacionPersona = new ClasificacionPersona(params)

        assert clasificacionPersona.save() != null

        // test invalid parameters in update
        params.id = clasificacionPersona.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/clasificacionPersona/edit"
        assert model.clasificacionPersonaInstance != null

        clasificacionPersona.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/clasificacionPersona/show/$clasificacionPersona.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        clasificacionPersona.clearErrors()

        populateValidParams(params)
        params.id = clasificacionPersona.id
        params.version = -1
        controller.update()

        assert view == "/clasificacionPersona/edit"
        assert model.clasificacionPersonaInstance != null
        assert model.clasificacionPersonaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/clasificacionPersona/list'

        response.reset()

        populateValidParams(params)
        def clasificacionPersona = new ClasificacionPersona(params)

        assert clasificacionPersona.save() != null
        assert ClasificacionPersona.count() == 1

        params.id = clasificacionPersona.id

        controller.delete()

        assert ClasificacionPersona.count() == 0
        assert ClasificacionPersona.get(clasificacionPersona.id) == null
        assert response.redirectedUrl == '/clasificacionPersona/list'
    }
}
