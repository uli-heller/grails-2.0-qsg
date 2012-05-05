package tekdays



import org.junit.*
import grails.test.mixin.*

@TestFor(TekUserController)
@Mock(TekUser)
class TekUserControllerTests {


    def populateValidParams(params) {
      assert params != null
      params["fullName"] = "fullName"
      params["userName"] = "userName"
      params["email"] = "email"
      params["website"] = "website"
      params["bio"] = "bio"
      params["password"] = "password"
    }

    void testIndex() {
        controller.index()
        assert "/tekUser/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tekUserInstanceList.size() == 0
        assert model.tekUserInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.tekUserInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tekUserInstance != null
        assert view == '/tekUser/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tekUser/show/1'
        assert controller.flash.message != null
        assert TekUser.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tekUser/list'


        populateValidParams(params)
        def tekUser = new TekUser(params)

        assert tekUser.save() != null

        params.id = tekUser.id

        def model = controller.show()

        assert model.tekUserInstance == tekUser
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tekUser/list'


        populateValidParams(params)
        def tekUser = new TekUser(params)

        assert tekUser.save() != null

        params.id = tekUser.id

        def model = controller.edit()

        assert model.tekUserInstance == tekUser
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tekUser/list'

        response.reset()


        populateValidParams(params)
        def tekUser = new TekUser(params)

        assert tekUser.save() != null

        // test invalid parameters in update
        params.id = tekUser.id
        params["password"] = null

        controller.update()

        assert view == "/tekUser/edit"
        assert model.tekUserInstance != null

        tekUser.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tekUser/show/$tekUser.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tekUser.clearErrors()

        populateValidParams(params)
        params.id = tekUser.id
        params.version = -1
        controller.update()

        assert view == "/tekUser/edit"
        assert model.tekUserInstance != null
        assert model.tekUserInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tekUser/list'

        response.reset()

        populateValidParams(params)
        def tekUser = new TekUser(params)

        assert tekUser.save() != null
        assert TekUser.count() == 1

        params.id = tekUser.id

        controller.delete()

        assert TekUser.count() == 0
        assert TekUser.get(tekUser.id) == null
        assert response.redirectedUrl == '/tekUser/list'
    }
}
