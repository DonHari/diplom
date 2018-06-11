package diplom

class ImageTagLib {

    /**
     * @attr classes REQUIRED
     * @attr src REQUIRED
     * @attr id REQUIRED
     * @attr onclick REQUIRED
     * @attr idModal REQUIRED
     */
    def clickableImage = { attrs, body ->
        StringBuilder sb = new StringBuilder()
        sb.append('<img class="')
        sb.append(attrs.classes)
//        List<String> classes = attrs.classes
//        for (String classElem : classes) {
//            sb.append(classElem)
//            sb.append(' ')
//        }
        sb.append('" id="')
        sb.append(attrs.id)
        sb.append('"')
        sb.append(' src="')
        sb.append(attrs.src)
        sb.append('" onclick="')
        sb.append(attrs.onclick)
        sb.append('"/>')
        sb.append('<div id="')
        sb.append(attrs.idModal)
        sb.append('" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog custom-modal-dialog">')
        sb.append('<div class="modal-content"><div class="modal-body">')
        sb.append('<img class="img-responsive custom-img-responsive" src="')
        sb.append(attrs.src)
        sb.append('">')
        sb.append('</div></div></div></div>')
        out << sb.toString()
    }
}
