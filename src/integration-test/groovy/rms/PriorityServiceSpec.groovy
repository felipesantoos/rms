package rms

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PriorityServiceSpec extends Specification {

    PriorityService priorityService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Priority(...).save(flush: true, failOnError: true)
        //new Priority(...).save(flush: true, failOnError: true)
        //Priority priority = new Priority(...).save(flush: true, failOnError: true)
        //new Priority(...).save(flush: true, failOnError: true)
        //new Priority(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //priority.id
    }

    void "test get"() {
        setupData()

        expect:
        priorityService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Priority> priorityList = priorityService.list(max: 2, offset: 2)

        then:
        priorityList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        priorityService.count() == 5
    }

    void "test delete"() {
        Long priorityId = setupData()

        expect:
        priorityService.count() == 5

        when:
        priorityService.delete(priorityId)
        sessionFactory.currentSession.flush()

        then:
        priorityService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Priority priority = new Priority()
        priorityService.save(priority)

        then:
        priority.id != null
    }
}
