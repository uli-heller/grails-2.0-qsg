package tekdays

import org.springframework.dao.DataIntegrityViolationException

class SponsorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sponsorInstanceList: Sponsor.list(params), sponsorInstanceTotal: Sponsor.count()]
    }

    def create() {
        [sponsorInstance: new Sponsor(params)]
    }

    def save() {
        def sponsorInstance = new Sponsor(params)
        if (!sponsorInstance.save(flush: true)) {
            render(view: "create", model: [sponsorInstance: sponsorInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), sponsorInstance.id])
        redirect(action: "show", id: sponsorInstance.id)
    }

    def show() {
        def sponsorInstance = Sponsor.get(params.id)
        if (!sponsorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), params.id])
            redirect(action: "list")
            return
        }

        [sponsorInstance: sponsorInstance]
    }

    def edit() {
        def sponsorInstance = Sponsor.get(params.id)
        if (!sponsorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), params.id])
            redirect(action: "list")
            return
        }

        [sponsorInstance: sponsorInstance]
    }

    def update() {
        def sponsorInstance = Sponsor.get(params.id)
        if (!sponsorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (sponsorInstance.version > version) {
                sponsorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'sponsor.label', default: 'Sponsor')] as Object[],
                          "Another user has updated this Sponsor while you were editing")
                render(view: "edit", model: [sponsorInstance: sponsorInstance])
                return
            }
        }

        sponsorInstance.properties = params

        if (!sponsorInstance.save(flush: true)) {
            render(view: "edit", model: [sponsorInstance: sponsorInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), sponsorInstance.id])
        redirect(action: "show", id: sponsorInstance.id)
    }

    def delete() {
        def sponsorInstance = Sponsor.get(params.id)
        if (!sponsorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), params.id])
            redirect(action: "list")
            return
        }

        try {
            sponsorInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sponsor.label', default: 'Sponsor'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
