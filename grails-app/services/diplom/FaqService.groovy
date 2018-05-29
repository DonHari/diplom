package diplom


interface FaqService {
    List<Faq> list(final String faqType)

    Faq save(final Faq faq)

    Faq update(final Faq faq)

    void delete(final Faq faq)

    Long count()
}
