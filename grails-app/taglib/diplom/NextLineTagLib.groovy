package diplom

class NextLineTagLib {
    /**
     * @attr source
     */
    def replaceNextLine = { attrs, body ->
        StringBuilder sb = new StringBuilder(attrs.source as String)
        sb = replaceAllSequences(sb, '\r\n', '<br/>')
        sb = replaceAllSequences(sb, '**', '<strong>', '</strong>')
        sb = replaceAllSequences(sb, '&&', '<mark>', '</mark>')
        sb = replaceAllSequences(sb, '!!', '<small>', '</small>')
        sb = replaceAllSequences(sb, '::', '<sub>', '</sub>')
        sb = replaceAllSequences(sb, '__', '<i>', '</i>')
        sb = replaceAllSequences(sb, '--', '<del>', '</del>')
        sb = replaceAllSequences(sb, '==', '<ins>', '</ins>')
        sb = replaceAllSequences(sb, '^^', '<sup>', '</sup>')
        sb = resolveLink(sb)
        out << sb.toString()
    }

    private StringBuilder replaceAllSequences(StringBuilder sb, String oldSeq, String newSeq) {
        int index = 0
        int newIndex = -1
        while (index <= sb.size() && ((newIndex = sb.indexOf(oldSeq, index)) != index || index == 0) && newIndex >= 0) {
            index = newIndex
            sb.replace(newIndex, newIndex + 2, newSeq)
            index += newSeq.length()
        }
        sb
    }

    private StringBuilder replaceAllSequences(StringBuilder sb, String oldSeq, String newSeqFirst, String newSeqSecond) {
        int index = 0
        int newIndex = -1
        boolean flag = true
        while (index <= sb.size() && ((newIndex = sb.indexOf(oldSeq, index)) != index || index == 0) && newIndex >= 0) {
            index = newIndex
            sb.replace(newIndex, newIndex + oldSeq.length(), flag ? newSeqFirst : newSeqSecond)
            flag = !flag
            index += (flag ? newSeqFirst : newSeqSecond).length()
        }
        sb
    }

    private StringBuilder resolveLink(StringBuilder sb) {
        int startLink = sb.indexOf('[')
        int endLink = sb.indexOf('](', startLink)
        int startMessage = endLink + 1
        int endMessage = sb.indexOf(')', startMessage)
        if (startLink >= 0 && endLink && startMessage && endMessage) {
            String link = sb.substring(startLink + 1, endLink)
            String message = sb.substring(startMessage + 1, endMessage)
            String aHref = "<a href=\"${link}\">${message}</a>"
            sb.replace(startLink, endMessage + 1, aHref)
        }
        sb
    }

    /**
     * @attr source
     */
    def replaceNextLineForDescription = { attrs, body ->
        StringBuilder sb = new StringBuilder(attrs.source as String)
        sb = replaceAllSequences(sb, '\r\n', ' ')
        out << sb.toString()
    }
}
