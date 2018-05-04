package diplom

import java.text.SimpleDateFormat

class DateFormatTagLib {
    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def dateFormat = { attrs, body ->
        out << new SimpleDateFormat(attrs.format).format(attrs.date)
    }
}
