package org.ekklesis



import org.junit.*
import grails.test.mixin.*

@TestFor(FamiliaController)
@Mock(Familia)
class FamiliaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/familia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.familiaInstanceList.size() == 0
        assert model.familiaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.familiaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.familiaInstance != null
        assert view == '/familia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/familia/show/1'
        assert controller.flash.message != null
        assert Familia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/familia/list'


        populateValidParams(params)
        def familia = new Familia(params)

        assert familia.save() != null

        params.id = familia.id

        def model = controller.show()

        assert model.familiaInstance == familia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/familia/list'


        populateValidParams(params)
        def familia = new Familia(params)

        assert familia.save() != null

        params.id = familia.id

        def model = controller.edit()

        assert model.familiaInstance == familia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/familia/list'

        response.reset()


        populateValidParams(params)
        def familia = new Familia(params)

        assert familia.save() != null

        // test invalid parameters in update
        params.id = familia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/familia/edit"
        assert model.familiaInstance != null

        familia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/familia/show/$familia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        familia.clearErrors()

        populateValidParams(params)
        params.id = familia.id
        params.version = -1
        controller.update()

        assert view == "/familia/edit"
        assert model.familiaInstance != null
        assert model.familiaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/familia/list'

        response.reset()

        populateValidParams(params)
        def familia = new Familia(params)

        assert familia.save() != null
        assert Familia.count() == 1

        params.id = familia.id

        controller.delete()

        assert Familia.count() == 0
        assert Familia.get(familia.id) == null
        assert response.redirectedUrl == '/familia/list'
    }
}
