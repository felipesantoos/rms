package rms

import grails.gorm.services.Service

@Service(Requirement)
interface RequirementService {

    Requirement get(Serializable id)

    List<Requirement> list(Map args)

    Long count()

    void delete(Serializable id)

    Requirement save(Requirement requirement)

}