package diplom.faq

enum FaqType {
    STUDENTS("STUDENTS"), //faq for students
    ENTRANTS("ENTRANTS") //faq for entrants

    String type

    FaqType(String type) {
        this.type = type
    }
}