package diplom

class CopyrightTagLib {
    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def currentYear = { args, body ->
        out << Calendar.getInstance().get(Calendar.YEAR)
    }
}
