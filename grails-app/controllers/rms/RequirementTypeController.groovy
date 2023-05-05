package rms

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class RequirementTypeController {

    RequirementTypeService requirementTypeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond requirementTypeService.list(params), model:[requirementTypeCount: requirementTypeService.count()]
    }

    def show(Long id) {
        respond requirementTypeService.get(id)
    }

    def create() {
        respond new RequirementType(params)
    }

    def save(RequirementType requirementType) {
        if (requirementType == null) {
            notFound()
            return
        }

        try {
            requirementTypeService.save(requirementType)
        } catch (ValidationException e) {
            respond requirementType.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'requirementType.label', default: 'RequirementType'), requirementType.id])
                redirect requirementType
            }
            '*' { respond requirementType, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond requirementTypeService.get(id)
    }

    def update(RequirementType requirementType) {
        if (requirementType == null) {
            notFound()
            return
        }

        try {
            requirementTypeService.save(requirementType)
        } catch (ValidationException e) {
            respond requirementType.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'requirementType.label', default: 'RequirementType'), requirementType.id])
                redirect requirementType
            }
            '*'{ respond requirementType, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        requirementTypeService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'requirementType.label', default: 'RequirementType'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementType.label', default: 'RequirementType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
