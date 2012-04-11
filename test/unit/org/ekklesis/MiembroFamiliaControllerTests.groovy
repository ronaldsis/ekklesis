package org.ekklesis



import org.junit.*
import grails.test.mixin.*

@TestFor(MiembroFamiliaController)
@Mock(MiembroFamilia)
class MiembroFamiliaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/miembroFamilia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.miembroFamiliaInstanceList.size() == 0
        assert model.miembroFamiliaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.miembroFamiliaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.miembroFamiliaInstance != null
        assert view == '/miembroFamilia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/miembroFamilia/show/1'
        assert controller.flash.message != null
        assert MiembroFamilia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/miembroFamilia/list'


        populateValidParams(params)
        def miembroFamilia = new MiembroFamilia(params)

        assert miembroFamilia.save() != null

        params.id = miembroFamilia.id

        def model = controller.show()

        assert model.miembroFamiliaInstance == miembroFamilia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/miembroFamilia/list'


        populateValidParams(params)
        def miembroFamilia = new MiembroFamilia(params)

        assert miembroFamilia.save() != null

        params.id = miembroFamilia.id

        def model = controller.edit()

        assert model.miembroFamiliaInstance == miembroFamilia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/miembroFamilia/list'

        response.reset()


        populateValidParams(params)
        def miembroFamilia = new MiembroFamilia(params)

        assert miembroFamilia.save() != null

        // test invalid parameters in update
        params.id = miembroFamilia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/miembroFamilia/edit"
        assert model.miembroFamiliaInstance != null

        miembroFamilia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/miembroFamilia/show/$miembroFamilia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        miembroFamilia.clearErrors()

        populateValidParams(params)
        params.id = miembroFamilia.id
        params.version = -1
        controller.update()

        assert view == "/miembroFamilia/edit"
        assert model.miembroFamiliaInstance != null
        assert model.miembroFamiliaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/miembroFamilia/list'

        response.reset()

        populateValidParams(params)
        def miembroFamilia = new MiembroFamilia(params)

        assert miembroFamilia.save() != null
        assert MiembroFamilia.count() == 1

        params.id = miembroFamilia.id

        controller.delete()

        assert MiembroFamilia.count() == 0
        assert MiembroFamilia.get(miembroFamilia.id) == null
        assert response.redirectedUrl == '/miembroFamilia/list'
    }
}
