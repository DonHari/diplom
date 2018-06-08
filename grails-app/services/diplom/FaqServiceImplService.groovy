package diplom

import diplom.commands.FaqCommand
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
    Faq update(FaqCommand faqCommand) {
        Faq faq = Faq.get(faqCommand.faqId)
        faq.with {
            it.question = faqCommand.question
            it.answer = faqCommand.answer
            it.faqType = faqCommand.faqType
            it
        }
        faq.save(flush: true)
    }

    @Override
    Long count() {
        Faq.count
    }

    @Override
    List<Faq> listForCurrentUser() {
        if (securityService.authorizedUserAndRole.role.authority == "ROLE_ADMIN") {
            return Faq.findAll([sort: 'faqType', order: 'asc'])
        }
        Faq.findAllByAuthor(securityService.authorizedUser, [sort: 'faqType', order: 'asc'])

    }
}
