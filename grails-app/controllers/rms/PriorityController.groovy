package rms

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PriorityController {

    PriorityService priorityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond priorityService.list(params), model:[priorityCount: priorityService.count()]
    }

    def show(Long id) {
        respond priorityService.get(id)
    }

    def create() {
        respond new Priority(params)
    }

    def save(Priority priority) {
        if (priority == null) {
            notFound()
            return
        }

        try {
            priorityService.save(priority)
        } catch (ValidationException e) {
            respond priority.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'priority.label', default: 'Priority'), priority.id])
                redirect priority
            }
            '*' { respond priority, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond priorityService.get(id)
    }

    def update(Priority priority) {
        if (priority == null) {
            notFound()
            return
        }

        try {
            priorityService.save(priority)
        } catch (ValidationException e) {
            respond priority.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'priority.label', default: 'Priority'), priority.id])
                redirect priority
            }
            '*'{ respond priority, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        priorityService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'priority.label', default: 'Priority'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'priority.label', default: 'Priority'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
