package tekdays



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(TaskService)
class TaskServiceTests {

    //void testSomething() {
    //    fail "Implement me"
    //}
    def taskService

    protected void setUp() {
        super.setUp()
        new TekUser(fullName: 'Tammy Tester',
                    userName: 'tester',
                    email:    'tester@test.com',
                    website:  'test.com',
                    bio:      'A test person').save()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testAddDefaultTasks() {
        def e = new TekEvent(name: 'Test Event',
                             city: 'TestCity, USA',
                             description: 'Test Description',
                             organizer: TekUser.findByUserName('tester'),
                             venue: 'TestCenter',
                             startDate: new Date(),
                             endDate: new Date() + 1)
        taskService.addDefaultTasks(e)
        assertEquals e.tasks.size(), 6
    }

}
