package diplom

import diplom.commands.FaqCommand


interface FaqService {
    List<Faq> list(final String faqType)

    Faq save(final Faq faq)

    Faq update(final FaqCommand faqCommand)

    void delete(final Faq faq)

    Long count()

    List<Faq> listForCurrentUser()
}
