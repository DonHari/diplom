package diplom

import diplom.faq.FaqType
import grails.transaction.Transactional

@Transactional
class FaqServiceImplService implements FaqService {

    SecurityService securityService

    private checkThatFaqExists = { Long id ->
        if (!Faq.exists(id)) {
            throw new CantFindException("Can't find faq")
        }
    }

    private checkIfAuthor = { Faq faq ->
        if (faq.author.id != securityService.getAuthorizedUser().id) {
            throw new CantUpdateException("You can't delete or update this faq")
        }
    }

    @Override
    List<Faq> list(String faqTypeStr) {
        FaqType faqType = faqTypeStr as FaqType
        Faq.findAllByFaqType(faqType)
    }

    @Override
    Faq save(Faq faq) {
        faq.author = securityService.getAuthorizedUser()
        faq.save()
    }

    @Override
    Faq update(Faq faq) {
        checkThatFaqExists(faq.id)
        checkIfAuthor(faq)
        faq.save()
    }

    @Override
    void delete(Faq faq) {
        checkThatFaqExists(faq.id)
        checkIfAuthor(faq)
        faq.delete()
    }

    @Override
    Long count() {
        Faq.count
    }
}
