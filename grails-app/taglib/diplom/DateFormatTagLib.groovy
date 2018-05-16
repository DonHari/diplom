package diplom

import java.text.SimpleDateFormat

class DateFormatTagLib {
    static defaultEncodeAs = [taglib: 'html']
//    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    /**
     * @attr format REQUIRED date format
     * @attr date REQUIRED
     */
    def dateFormat = { attrs, body ->
        out << new SimpleDateFormat(attrs.format).format(attrs.date)
    }

    /**
     * @attr format REQUIRED date format
     * @attr createDate REQUIRED
     * @attr updateDate REQUIRED
     */
    def tooltipDates = { attrs, body ->
        StringBuilder sb = new StringBuilder()
        SimpleDateFormat dateFormat = new SimpleDateFormat(attrs.format)
        sb.append('<div class="row"><div class="col">Дата створення:</div><div class="col">')
        sb.append(dateFormat.format(attrs.createDate))
        sb.append('</div>')
        sb.append('<div class="row"><div class="col">Дата оновлення:</div><div class="col">')
        sb.append(dateFormat.format(attrs.updateDate))
        sb.append('</div>')
        out << sb.toString()
    }
}
