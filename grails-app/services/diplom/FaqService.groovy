package diplom

import diplom.commands.FaqCommand


interface FaqService {
    List<Faq> list(final String faqType)

    Faq save(final Faq faq)

    Faq update(final FaqCommand faqCommand)

    Long count()

    List<Faq> listForCurrentUser()
}
