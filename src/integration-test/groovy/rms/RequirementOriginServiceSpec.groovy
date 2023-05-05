package rms

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class RequirementOriginServiceSpec extends Specification {

    RequirementOriginService requirementOriginService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new RequirementOrigin(...).save(flush: true, failOnError: true)
        //new RequirementOrigin(...).save(flush: true, failOnError: true)
        //RequirementOrigin requirementOrigin = new RequirementOrigin(...).save(flush: true, failOnError: true)
        //new RequirementOrigin(...).save(flush: true, failOnError: true)
        //new RequirementOrigin(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //requirementOrigin.id
    }

    void "test get"() {
        setupData()

        expect:
        requirementOriginService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<RequirementOrigin> requirementOriginList = requirementOriginService.list(max: 2, offset: 2)

        then:
        requirementOriginList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        requirementOriginService.count() == 5
    }

    void "test delete"() {
        Long requirementOriginId = setupData()

        expect:
        requirementOriginService.count() == 5

        when:
        requirementOriginService.delete(requirementOriginId)
        sessionFactory.currentSession.flush()

        then:
        requirementOriginService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        RequirementOrigin requirementOrigin = new RequirementOrigin()
        requirementOriginService.save(requirementOrigin)

        then:
        requirementOrigin.id != null
    }
}
