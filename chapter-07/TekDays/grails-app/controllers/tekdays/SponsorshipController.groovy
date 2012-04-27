package tekdays

import org.springframework.dao.DataIntegrityViolationException

class SponsorshipController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sponsorshipInstanceList: Sponsorship.list(params), sponsorshipInstanceTotal: Sponsorship.count()]
    }

    def create() {
        [sponsorshipInstance: new Sponsorship(params)]
    }

    def save() {
        def sponsorshipInstance = new Sponsorship(params)
        if (!sponsorshipInstance.save(flush: true)) {
            render(view: "create", model: [sponsorshipInstance: sponsorshipInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), sponsorshipInstance.id])
        redirect(action: "show", id: sponsorshipInstance.id)
    }

    def show() {
        def sponsorshipInstance = Sponsorship.get(params.id)
        if (!sponsorshipInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), params.id])
            redirect(action: "list")
            return
        }

        [sponsorshipInstance: sponsorshipInstance]
    }

    def edit() {
        def sponsorshipInstance = Sponsorship.get(params.id)
        if (!sponsorshipInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), params.id])
            redirect(action: "list")
            return
        }

        [sponsorshipInstance: sponsorshipInstance]
    }

    def update() {
        def sponsorshipInstance = Sponsorship.get(params.id)
        if (!sponsorshipInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (sponsorshipInstance.version > version) {
                sponsorshipInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'sponsorship.label', default: 'Sponsorship')] as Object[],
                          "Another user has updated this Sponsorship while you were editing")
                render(view: "edit", model: [sponsorshipInstance: sponsorshipInstance])
                return
            }
        }

        sponsorshipInstance.properties = params

        if (!sponsorshipInstance.save(flush: true)) {
            render(view: "edit", model: [sponsorshipInstance: sponsorshipInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), sponsorshipInstance.id])
        redirect(action: "show", id: sponsorshipInstance.id)
    }

    def delete() {
        def sponsorshipInstance = Sponsorship.get(params.id)
        if (!sponsorshipInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), params.id])
            redirect(action: "list")
            return
        }

        try {
            sponsorshipInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
