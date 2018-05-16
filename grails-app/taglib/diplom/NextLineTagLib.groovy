package diplom

class NextLineTagLib {
    /**
     * @attr source
     */
    def replaceNextLine = { attrs, body ->
        String str = attrs.source
        str = str.replace('\r\n', '<br/>')
        out << str
    }
}
