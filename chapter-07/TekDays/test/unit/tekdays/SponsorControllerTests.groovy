package tekdays



import org.junit.*
import grails.test.mixin.*

@TestFor(SponsorController)
@Mock(Sponsor)
class SponsorControllerTests {


    def populateValidParams(params) {
      assert params != null
      params["name"] = "name"
      params["website"] = "website"
    }

    void testIndex() {
        controller.index()
        assert "/sponsor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sponsorInstanceList.size() == 0
        assert model.sponsorInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.sponsorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.sponsorInstance != null
        assert view == '/sponsor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sponsor/show/1'
        assert controller.flash.message != null
        assert Sponsor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sponsor/list'


        populateValidParams(params)
        def sponsor = new Sponsor(params)

        assert sponsor.save() != null

        params.id = sponsor.id

        def model = controller.show()

        assert model.sponsorInstance == sponsor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sponsor/list'


        populateValidParams(params)
        def sponsor = new Sponsor(params)

        assert sponsor.save() != null

        params.id = sponsor.id

        def model = controller.edit()

        assert model.sponsorInstance == sponsor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sponsor/list'

        response.reset()


        populateValidParams(params)
        def sponsor = new Sponsor(params)

        assert sponsor.save() != null

        // test invalid parameters in update
        params.id = sponsor.id
        params["name"] = null

        controller.update()

        assert view == "/sponsor/edit"
        assert model.sponsorInstance != null

        sponsor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sponsor/show/$sponsor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sponsor.clearErrors()

        populateValidParams(params)
        params.id = sponsor.id
        params.version = -1
        controller.update()

        assert view == "/sponsor/edit"
        assert model.sponsorInstance != null
        assert model.sponsorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sponsor/list'

        response.reset()

        populateValidParams(params)
        def sponsor = new Sponsor(params)

        assert sponsor.save() != null
        assert Sponsor.count() == 1

        params.id = sponsor.id

        controller.delete()

        assert Sponsor.count() == 0
        assert Sponsor.get(sponsor.id) == null
        assert response.redirectedUrl == '/sponsor/list'
    }
}
