package rms

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class RequirementServiceSpec extends Specification {

    RequirementService requirementService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Requirement(...).save(flush: true, failOnError: true)
        //new Requirement(...).save(flush: true, failOnError: true)
        //Requirement requirement = new Requirement(...).save(flush: true, failOnError: true)
        //new Requirement(...).save(flush: true, failOnError: true)
        //new Requirement(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //requirement.id
    }

    void "test get"() {
        setupData()

        expect:
        requirementService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Requirement> requirementList = requirementService.list(max: 2, offset: 2)

        then:
        requirementList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        requirementService.count() == 5
    }

    void "test delete"() {
        Long requirementId = setupData()

        expect:
        requirementService.count() == 5

        when:
        requirementService.delete(requirementId)
        sessionFactory.currentSession.flush()

        then:
        requirementService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Requirement requirement = new Requirement()
        requirementService.save(requirement)

        then:
        requirement.id != null
    }
}
