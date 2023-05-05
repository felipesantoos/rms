package rms

import grails.gorm.services.Service

@Service(RequirementType)
interface RequirementTypeService {

    RequirementType get(Serializable id)

    List<RequirementType> list(Map args)

    Long count()

    void delete(Serializable id)

    RequirementType save(RequirementType requirementType)

}