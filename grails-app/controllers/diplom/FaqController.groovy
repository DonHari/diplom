package diplom

import diplom.commands.FaqCommand
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.NO_CONTENT

class FaqController {

    FaqService faqService

    @Secured('permitAll')
    def index(String faqType) {
        List<Faq> faqList = faqService.list(faqType)
        Long faqCount = faqService.count()
        respond(faqList, model: [faqCount: faqCount])
    }

    @Secured('permitAll')
    def show(Faq faq) {
        respond(faq)
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN", "IS_AUTHENTICATED_REMEMBERED"])
    def create() {
        respond(new Faq(params), model: [justSaved: chainModel?.justSaved ?: false])
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN", "IS_AUTHENTICATED_REMEMBERED"])
    def save(Faq faq) {
        faqService.save(faq)

        chain(action: 'create', model: [justSaved: true])
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN", "IS_AUTHENTICATED_REMEMBERED"])
    @Transactional
    def update(FaqCommand faqCommand) {
        faqService.update(faqCommand)

        chain(action: 'managing', model: [justUpdated: true])
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN", "IS_AUTHENTICATED_REMEMBERED"])
    @Transactional
    def managing() {
        List<Faq> faqList = faqService.listForCurrentUser()

        respond(faqList, model: [justUpdated: chainModel?.justUpdated])
    }

}
