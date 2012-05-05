package tekdays



import org.junit.*
import grails.test.mixin.*

@TestFor(TekEventController)
@Mock([TekEvent,TekUser])
class TekEventControllerTests {


    def populateValidParams(params) {
      assert params != null
      params["name"] = 'name'
      params["city"] = 'city'
      params["description"] = 'city'
      params["venue"] = 'venue'
      params["startDate"] = new Date()
      params["endDate"] = new Date()
      def tekUser = new TekUser(
		fullName: 'f',
		userName: 'u',
		password: 'p',
		email: 'e',
		website: 'w',
		bio: 'b'
	).save()
      println "tekUser=${tekUser}"
      params["organizer"] = tekUser;
    }

    void testIndex() {
        controller.index()
        assert "/tekEvent/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tekEventInstanceList.size() == 0
        assert model.tekEventInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.tekEventInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tekEventInstance != null
        assert view == '/tekEvent/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tekEvent/show/1'
        assert controller.flash.message != null
        assert TekEvent.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tekEvent/list'


        populateValidParams(params)
        def tekEvent = new TekEvent(params)

        assert tekEvent.save() != null

        params.id = tekEvent.id

        def model = controller.show()

        assert model.tekEventInstance == tekEvent
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tekEvent/list'


        populateValidParams(params)
        def tekEvent = new TekEvent(params)

        assert tekEvent.save() != null

        params.id = tekEvent.id

        def model = controller.edit()

        assert model.tekEventInstance == tekEvent
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tekEvent/list'

        response.reset()


        populateValidParams(params)
        def tekEvent = new TekEvent(params)

        assert tekEvent.save() != null

        // test invalid parameters in update
        params.id = tekEvent.id
        params.name = null

        controller.update()

        assert view == "/tekEvent/edit"
        assert model.tekEventInstance != null

        tekEvent.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tekEvent/show/$tekEvent.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tekEvent.clearErrors()

        populateValidParams(params)
        params.id = tekEvent.id
        params.version = -1
        controller.update()

        assert view == "/tekEvent/edit"
        assert model.tekEventInstance != null
        assert model.tekEventInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tekEvent/list'

        response.reset()

        populateValidParams(params)
        def tekEvent = new TekEvent(params)

        assert tekEvent.save() != null
        assert TekEvent.count() == 1

        params.id = tekEvent.id

        controller.delete()

        assert TekEvent.count() == 0
        assert TekEvent.get(tekEvent.id) == null
        assert response.redirectedUrl == '/tekEvent/list'
    }
}
