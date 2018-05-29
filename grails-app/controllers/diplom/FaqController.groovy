package diplom

import diplom.faq.FaqType
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.NO_CONTENT
import static org.springframework.http.HttpStatus.OK

@Transactional(readOnly = true)
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
    @Transactional
    def save(Faq faq) {
        faqService.save(faq)

        chain(action: 'create', model: [justSaved: true])
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN", "IS_AUTHENTICATED_REMEMBERED"])
    def edit(Faq faq) {
        respond(faq)
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN", "IS_AUTHENTICATED_REMEMBERED"])
    @Transactional
    def update(Faq faq) {
        Faq updatedFaq = faqService.update(faq)

        respond(updatedFaq, status: OK, view: "/faq/show")
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN", "IS_AUTHENTICATED_REMEMBERED"])
    @Transactional
    def delete(Faq faq) {
        faqService.delete(faq)

        redirect(controller: "faq", action: "index", method: "GET", status: NO_CONTENT)
    }
}
