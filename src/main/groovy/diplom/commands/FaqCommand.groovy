package diplom.commands

import diplom.faq.FaqType
import grails.validation.Validateable

class FaqCommand implements Validateable {
    Long faqId
    String question
    String answer
    FaqType faqType

    static constraints = {
        faqId nullable: false, min: 1L
        question nullable: false, blank: false
        answer nullable: false, blank: false
    }
}
