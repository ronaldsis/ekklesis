package org.ekklesis



import org.junit.*
import grails.test.mixin.*

@TestFor(ReunionController)
@Mock(Reunion)
class ReunionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/reunion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.reunionInstanceList.size() == 0
        assert model.reunionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.reunionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.reunionInstance != null
        assert view == '/reunion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/reunion/show/1'
        assert controller.flash.message != null
        assert Reunion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/reunion/list'


        populateValidParams(params)
        def reunion = new Reunion(params)

        assert reunion.save() != null

        params.id = reunion.id

        def model = controller.show()

        assert model.reunionInstance == reunion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/reunion/list'


        populateValidParams(params)
        def reunion = new Reunion(params)

        assert reunion.save() != null

        params.id = reunion.id

        def model = controller.edit()

        assert model.reunionInstance == reunion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/reunion/list'

        response.reset()


        populateValidParams(params)
        def reunion = new Reunion(params)

        assert reunion.save() != null

        // test invalid parameters in update
        params.id = reunion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/reunion/edit"
        assert model.reunionInstance != null

        reunion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/reunion/show/$reunion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        reunion.clearErrors()

        populateValidParams(params)
        params.id = reunion.id
        params.version = -1
        controller.update()

        assert view == "/reunion/edit"
        assert model.reunionInstance != null
        assert model.reunionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/reunion/list'

        response.reset()

        populateValidParams(params)
        def reunion = new Reunion(params)

        assert reunion.save() != null
        assert Reunion.count() == 1

        params.id = reunion.id

        controller.delete()

        assert Reunion.count() == 0
        assert Reunion.get(reunion.id) == null
        assert response.redirectedUrl == '/reunion/list'
    }
}
