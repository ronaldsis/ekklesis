package org.ekklesis



import org.junit.*
import grails.test.mixin.*

@TestFor(IglesiaController)
@Mock(Iglesia)
class IglesiaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/iglesia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.iglesiaInstanceList.size() == 0
        assert model.iglesiaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.iglesiaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.iglesiaInstance != null
        assert view == '/iglesia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/iglesia/show/1'
        assert controller.flash.message != null
        assert Iglesia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/iglesia/list'


        populateValidParams(params)
        def iglesia = new Iglesia(params)

        assert iglesia.save() != null

        params.id = iglesia.id

        def model = controller.show()

        assert model.iglesiaInstance == iglesia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/iglesia/list'


        populateValidParams(params)
        def iglesia = new Iglesia(params)

        assert iglesia.save() != null

        params.id = iglesia.id

        def model = controller.edit()

        assert model.iglesiaInstance == iglesia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/iglesia/list'

        response.reset()


        populateValidParams(params)
        def iglesia = new Iglesia(params)

        assert iglesia.save() != null

        // test invalid parameters in update
        params.id = iglesia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/iglesia/edit"
        assert model.iglesiaInstance != null

        iglesia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/iglesia/show/$iglesia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        iglesia.clearErrors()

        populateValidParams(params)
        params.id = iglesia.id
        params.version = -1
        controller.update()

        assert view == "/iglesia/edit"
        assert model.iglesiaInstance != null
        assert model.iglesiaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/iglesia/list'

        response.reset()

        populateValidParams(params)
        def iglesia = new Iglesia(params)

        assert iglesia.save() != null
        assert Iglesia.count() == 1

        params.id = iglesia.id

        controller.delete()

        assert Iglesia.count() == 0
        assert Iglesia.get(iglesia.id) == null
        assert response.redirectedUrl == '/iglesia/list'
    }
}
