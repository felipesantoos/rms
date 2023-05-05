package rms

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class RequirementOriginController {

    RequirementOriginService requirementOriginService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond requirementOriginService.list(params), model:[requirementOriginCount: requirementOriginService.count()]
    }

    def show(Long id) {
        respond requirementOriginService.get(id)
    }

    def create() {
        respond new RequirementOrigin(params)
    }

    def save(RequirementOrigin requirementOrigin) {
        if (requirementOrigin == null) {
            notFound()
            return
        }

        try {
            requirementOriginService.save(requirementOrigin)
        } catch (ValidationException e) {
            respond requirementOrigin.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'requirementOrigin.label', default: 'RequirementOrigin'), requirementOrigin.id])
                redirect requirementOrigin
            }
            '*' { respond requirementOrigin, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond requirementOriginService.get(id)
    }

    def update(RequirementOrigin requirementOrigin) {
        if (requirementOrigin == null) {
            notFound()
            return
        }

        try {
            requirementOriginService.save(requirementOrigin)
        } catch (ValidationException e) {
            respond requirementOrigin.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'requirementOrigin.label', default: 'RequirementOrigin'), requirementOrigin.id])
                redirect requirementOrigin
            }
            '*'{ respond requirementOrigin, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        requirementOriginService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'requirementOrigin.label', default: 'RequirementOrigin'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementOrigin.label', default: 'RequirementOrigin'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
