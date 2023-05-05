package rms

import grails.gorm.services.Service

@Service(Priority)
interface PriorityService {

    Priority get(Serializable id)

    List<Priority> list(Map args)

    Long count()

    void delete(Serializable id)

    Priority save(Priority priority)

}