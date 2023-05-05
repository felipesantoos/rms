package rms

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class RequirementController {

    RequirementService requirementService
    ProjectService projectService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond requirementService.list(params), model:[
                requirementCount: requirementService.count(),
                requirementTypeList: RequirementType.list(),
                requirementOriginList: RequirementOrigin.list(),
                priorityList: Priority.list()
        ]
    }

    def show(Long id) {
        respond requirementService.get(id)
    }

    def create() {
        respond new Requirement(params)
    }

    def save(Requirement requirement) {
        if (requirement == null) {
            notFound()
            return
        }

        Requirement lastRequirement = Requirement.last()
        Project project = projectService.get(requirement.project.id)
        String code = "${project.alias}-${lastRequirement != null ? lastRequirement.id+1 : 1}"
        requirement.setCode(code)

        try {
            requirementService.save(requirement)
        } catch (ValidationException e) {
            respond requirement.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'requirement.label', default: 'Requirement'), requirement.id])
                redirect requirement
            }
            '*' { respond requirement, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond requirementService.get(id)
    }

    def update(Requirement requirement) {
        if (requirement == null) {
            notFound()
            return
        }

        try {
            requirementService.save(requirement)
        } catch (ValidationException e) {
            respond requirement.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'requirement.label', default: 'Requirement'), requirement.id])
                redirect requirement
            }
            '*'{ respond requirement, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        requirementService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'requirement.label', default: 'Requirement'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirement.label', default: 'Requirement'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
