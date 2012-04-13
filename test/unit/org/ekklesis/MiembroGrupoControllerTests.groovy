package org.ekklesis



import org.junit.*
import grails.test.mixin.*

@TestFor(MiembroGrupoController)
@Mock(MiembroGrupo)
class MiembroGrupoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/miembroGrupo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.miembroGrupoInstanceList.size() == 0
        assert model.miembroGrupoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.miembroGrupoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.miembroGrupoInstance != null
        assert view == '/miembroGrupo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/miembroGrupo/show/1'
        assert controller.flash.message != null
        assert MiembroGrupo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/miembroGrupo/list'


        populateValidParams(params)
        def miembroGrupo = new MiembroGrupo(params)

        assert miembroGrupo.save() != null

        params.id = miembroGrupo.id

        def model = controller.show()

        assert model.miembroGrupoInstance == miembroGrupo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/miembroGrupo/list'


        populateValidParams(params)
        def miembroGrupo = new MiembroGrupo(params)

        assert miembroGrupo.save() != null

        params.id = miembroGrupo.id

        def model = controller.edit()

        assert model.miembroGrupoInstance == miembroGrupo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/miembroGrupo/list'

        response.reset()


        populateValidParams(params)
        def miembroGrupo = new MiembroGrupo(params)

        assert miembroGrupo.save() != null

        // test invalid parameters in update
        params.id = miembroGrupo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/miembroGrupo/edit"
        assert model.miembroGrupoInstance != null

        miembroGrupo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/miembroGrupo/show/$miembroGrupo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        miembroGrupo.clearErrors()

        populateValidParams(params)
        params.id = miembroGrupo.id
        params.version = -1
        controller.update()

        assert view == "/miembroGrupo/edit"
        assert model.miembroGrupoInstance != null
        assert model.miembroGrupoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/miembroGrupo/list'

        response.reset()

        populateValidParams(params)
        def miembroGrupo = new MiembroGrupo(params)

        assert miembroGrupo.save() != null
        assert MiembroGrupo.count() == 1

        params.id = miembroGrupo.id

        controller.delete()

        assert MiembroGrupo.count() == 0
        assert MiembroGrupo.get(miembroGrupo.id) == null
        assert response.redirectedUrl == '/miembroGrupo/list'
    }
}
