package rms

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class RequirementTypeServiceSpec extends Specification {

    RequirementTypeService requirementTypeService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new RequirementType(...).save(flush: true, failOnError: true)
        //new RequirementType(...).save(flush: true, failOnError: true)
        //RequirementType requirementType = new RequirementType(...).save(flush: true, failOnError: true)
        //new RequirementType(...).save(flush: true, failOnError: true)
        //new RequirementType(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //requirementType.id
    }

    void "test get"() {
        setupData()

        expect:
        requirementTypeService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<RequirementType> requirementTypeList = requirementTypeService.list(max: 2, offset: 2)

        then:
        requirementTypeList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        requirementTypeService.count() == 5
    }

    void "test delete"() {
        Long requirementTypeId = setupData()

        expect:
        requirementTypeService.count() == 5

        when:
        requirementTypeService.delete(requirementTypeId)
        sessionFactory.currentSession.flush()

        then:
        requirementTypeService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        RequirementType requirementType = new RequirementType()
        requirementTypeService.save(requirementType)

        then:
        requirementType.id != null
    }
}
