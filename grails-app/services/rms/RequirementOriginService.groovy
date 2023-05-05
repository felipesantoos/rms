package rms

import grails.gorm.services.Service

@Service(RequirementOrigin)
interface RequirementOriginService {

    RequirementOrigin get(Serializable id)

    List<RequirementOrigin> list(Map args)

    Long count()

    void delete(Serializable id)

    RequirementOrigin save(RequirementOrigin requirementOrigin)

}