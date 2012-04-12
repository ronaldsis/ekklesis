package org.ekklesis



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoGrupoController)
@Mock(TipoGrupo)
class TipoGrupoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoGrupo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoGrupoInstanceList.size() == 0
        assert model.tipoGrupoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.tipoGrupoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoGrupoInstance != null
        assert view == '/tipoGrupo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoGrupo/show/1'
        assert controller.flash.message != null
        assert TipoGrupo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoGrupo/list'


        populateValidParams(params)
        def tipoGrupo = new TipoGrupo(params)

        assert tipoGrupo.save() != null

        params.id = tipoGrupo.id

        def model = controller.show()

        assert model.tipoGrupoInstance == tipoGrupo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoGrupo/list'


        populateValidParams(params)
        def tipoGrupo = new TipoGrupo(params)

        assert tipoGrupo.save() != null

        params.id = tipoGrupo.id

        def model = controller.edit()

        assert model.tipoGrupoInstance == tipoGrupo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoGrupo/list'

        response.reset()


        populateValidParams(params)
        def tipoGrupo = new TipoGrupo(params)

        assert tipoGrupo.save() != null

        // test invalid parameters in update
        params.id = tipoGrupo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoGrupo/edit"
        assert model.tipoGrupoInstance != null

        tipoGrupo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoGrupo/show/$tipoGrupo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoGrupo.clearErrors()

        populateValidParams(params)
        params.id = tipoGrupo.id
        params.version = -1
        controller.update()

        assert view == "/tipoGrupo/edit"
        assert model.tipoGrupoInstance != null
        assert model.tipoGrupoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoGrupo/list'

        response.reset()

        populateValidParams(params)
        def tipoGrupo = new TipoGrupo(params)

        assert tipoGrupo.save() != null
        assert TipoGrupo.count() == 1

        params.id = tipoGrupo.id

        controller.delete()

        assert TipoGrupo.count() == 0
        assert TipoGrupo.get(tipoGrupo.id) == null
        assert response.redirectedUrl == '/tipoGrupo/list'
    }
}
