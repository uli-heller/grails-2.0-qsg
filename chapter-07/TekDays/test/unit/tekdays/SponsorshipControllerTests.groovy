package tekdays



import org.junit.*
import grails.test.mixin.*

@TestFor(SponsorshipController)
@Mock(Sponsorship)
class SponsorshipControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/sponsorship/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sponsorshipInstanceList.size() == 0
        assert model.sponsorshipInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.sponsorshipInstance != null
    }

    void testSave() {
        controller.save()

        assert model.sponsorshipInstance != null
        assert view == '/sponsorship/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sponsorship/show/1'
        assert controller.flash.message != null
        assert Sponsorship.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sponsorship/list'


        populateValidParams(params)
        def sponsorship = new Sponsorship(params)

        assert sponsorship.save() != null

        params.id = sponsorship.id

        def model = controller.show()

        assert model.sponsorshipInstance == sponsorship
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sponsorship/list'


        populateValidParams(params)
        def sponsorship = new Sponsorship(params)

        assert sponsorship.save() != null

        params.id = sponsorship.id

        def model = controller.edit()

        assert model.sponsorshipInstance == sponsorship
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sponsorship/list'

        response.reset()


        populateValidParams(params)
        def sponsorship = new Sponsorship(params)

        assert sponsorship.save() != null

        // test invalid parameters in update
        params.id = sponsorship.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/sponsorship/edit"
        assert model.sponsorshipInstance != null

        sponsorship.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sponsorship/show/$sponsorship.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sponsorship.clearErrors()

        populateValidParams(params)
        params.id = sponsorship.id
        params.version = -1
        controller.update()

        assert view == "/sponsorship/edit"
        assert model.sponsorshipInstance != null
        assert model.sponsorshipInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sponsorship/list'

        response.reset()

        populateValidParams(params)
        def sponsorship = new Sponsorship(params)

        assert sponsorship.save() != null
        assert Sponsorship.count() == 1

        params.id = sponsorship.id

        controller.delete()

        assert Sponsorship.count() == 0
        assert Sponsorship.get(sponsorship.id) == null
        assert response.redirectedUrl == '/sponsorship/list'
    }
}
