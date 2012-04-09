package org.ekklesis



import org.junit.*
import grails.test.mixin.*

@TestFor(ReunionPersonaController)
@Mock(ReunionPersona)
class ReunionPersonaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/reunionPersona/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.reunionPersonaInstanceList.size() == 0
        assert model.reunionPersonaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.reunionPersonaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.reunionPersonaInstance != null
        assert view == '/reunionPersona/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/reunionPersona/show/1'
        assert controller.flash.message != null
        assert ReunionPersona.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/reunionPersona/list'


        populateValidParams(params)
        def reunionPersona = new ReunionPersona(params)

        assert reunionPersona.save() != null

        params.id = reunionPersona.id

        def model = controller.show()

        assert model.reunionPersonaInstance == reunionPersona
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/reunionPersona/list'


        populateValidParams(params)
        def reunionPersona = new ReunionPersona(params)

        assert reunionPersona.save() != null

        params.id = reunionPersona.id

        def model = controller.edit()

        assert model.reunionPersonaInstance == reunionPersona
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/reunionPersona/list'

        response.reset()


        populateValidParams(params)
        def reunionPersona = new ReunionPersona(params)

        assert reunionPersona.save() != null

        // test invalid parameters in update
        params.id = reunionPersona.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/reunionPersona/edit"
        assert model.reunionPersonaInstance != null

        reunionPersona.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/reunionPersona/show/$reunionPersona.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        reunionPersona.clearErrors()

        populateValidParams(params)
        params.id = reunionPersona.id
        params.version = -1
        controller.update()

        assert view == "/reunionPersona/edit"
        assert model.reunionPersonaInstance != null
        assert model.reunionPersonaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/reunionPersona/list'

        response.reset()

        populateValidParams(params)
        def reunionPersona = new ReunionPersona(params)

        assert reunionPersona.save() != null
        assert ReunionPersona.count() == 1

        params.id = reunionPersona.id

        controller.delete()

        assert ReunionPersona.count() == 0
        assert ReunionPersona.get(reunionPersona.id) == null
        assert response.redirectedUrl == '/reunionPersona/list'
    }
}
