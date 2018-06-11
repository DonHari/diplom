package diplom

class FaqTypeTagLib {
    static defaultEncodeAs = [taglib: 'html']

    /**
     * @attr type REQUIRED
     */
    def resolveFaqType = { attrs, body ->
        String type = attrs.type
        if (type == "STUDENTS") {
            out << "Для студентів"
        } else if (type == "ENTRANTS") {
            out << "Для абітурієнтів"
        }
    }
}
