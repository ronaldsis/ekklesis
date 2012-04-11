package org.ekklesis



import org.junit.*
import grails.test.mixin.*

@TestFor(RolGrupoController)
@Mock(RolGrupo)
class RolGrupoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/rolGrupo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.rolGrupoInstanceList.size() == 0
        assert model.rolGrupoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.rolGrupoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.rolGrupoInstance != null
        assert view == '/rolGrupo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/rolGrupo/show/1'
        assert controller.flash.message != null
        assert RolGrupo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/rolGrupo/list'


        populateValidParams(params)
        def rolGrupo = new RolGrupo(params)

        assert rolGrupo.save() != null

        params.id = rolGrupo.id

        def model = controller.show()

        assert model.rolGrupoInstance == rolGrupo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/rolGrupo/list'


        populateValidParams(params)
        def rolGrupo = new RolGrupo(params)

        assert rolGrupo.save() != null

        params.id = rolGrupo.id

        def model = controller.edit()

        assert model.rolGrupoInstance == rolGrupo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/rolGrupo/list'

        response.reset()


        populateValidParams(params)
        def rolGrupo = new RolGrupo(params)

        assert rolGrupo.save() != null

        // test invalid parameters in update
        params.id = rolGrupo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/rolGrupo/edit"
        assert model.rolGrupoInstance != null

        rolGrupo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/rolGrupo/show/$rolGrupo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        rolGrupo.clearErrors()

        populateValidParams(params)
        params.id = rolGrupo.id
        params.version = -1
        controller.update()

        assert view == "/rolGrupo/edit"
        assert model.rolGrupoInstance != null
        assert model.rolGrupoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/rolGrupo/list'

        response.reset()

        populateValidParams(params)
        def rolGrupo = new RolGrupo(params)

        assert rolGrupo.save() != null
        assert RolGrupo.count() == 1

        params.id = rolGrupo.id

        controller.delete()

        assert RolGrupo.count() == 0
        assert RolGrupo.get(rolGrupo.id) == null
        assert response.redirectedUrl == '/rolGrupo/list'
    }
}
