package diplom

class PaginationTagLib {

    /**
     * @attr total REQUIRED Count of all items
     * @attr max Max per page item count
     */
    def customPagination = { attrs, body ->
        Integer max = attrs.max ?: 10
        Integer total = attrs.total
        Integer offset = params.int('offset') ?: 0
        Integer currentPage = 1 + (offset / max) as Integer
        final Integer firstPage = 1
        final Integer lastPage = Math.round(Math.ceil(total / max)) as Integer
        StringBuilder sb = new StringBuilder()

        if (firstPage != lastPage) {

            addPagingContainerStart(sb)
            addLeftAquo(sb, offset, max, currentPage, firstPage)

            if (max > 0 && lastPage > firstPage) {
                int beginstep = currentPage - 1
                int endstep = currentPage + 1

                if (beginstep < firstPage) {
                    beginstep = firstPage
                    endstep = firstPage + 4
                }
                if (endstep > lastPage) {
                    beginstep = lastPage - 4
                    if (beginstep < firstPage) {
                        beginstep = firstPage
                    }
                    endstep = lastPage
                }

                // display firststep link when beginstep is not firststep
                if (beginstep > firstPage && !attrs.boolean('omitFirst')) {
                    addFirstPage(sb, currentPage, firstPage, max)
                }
                //show a gap if beginstep isn't immediately after firststep, and if were not omitting first or rev
                if (beginstep > firstPage + 1 && (!attrs.boolean('omitFirst') || !attrs.boolean('omitPrev'))) {
                    addTripleDot(sb)
                }

                // display paginate steps
                (beginstep..endstep).each { int i ->
                    if (currentPage == i) {
                        addPage(sb, 0, 0, "${i}", true)
                    } else {
                        addPage(sb, (i - 1) * max, max, "${i}")
                    }
                }

                //show a gap if beginstep isn't immediately before firststep, and if were not omitting first or rev
                if (endstep + 1 < lastPage && (!attrs.boolean('omitLast') || !attrs.boolean('omitNext'))) {
                    addTripleDot(sb)
                }
                // display laststep link when endstep is not laststep
                if (endstep < lastPage && !attrs.boolean('omitLast')) {
                    addLastPage(sb, currentPage, lastPage, total, max)
                }
            }

            addRightAquo(sb, offset, max, total, currentPage, lastPage)
            addPagingContainerEnd(sb)
            out << sb.toString()
        }
    }

    private void addPage(StringBuilder sb, Integer linkOffset, Integer linkMax, String text, Boolean active = false, Boolean disabled = false) {
        if (disabled) {
            sb.append('<li class="page-item"><a class="page-link custom-page-link disabled" href="#" disabled>')
            sb.append(text)
            sb.append('</a></li>')
        } else if (active) {
            sb.append('<li class="page-item"><a class="page-link custom-page-link active" href="#" disabled>')
            sb.append(text)
            sb.append('</a></li>')
        } else {
            sb.append('<li class="page-item"><a class="page-link custom-page-link" href="')
            sb.append('/news/index?offset=')
            sb.append(linkOffset)
            sb.append('&max=')
            sb.append(linkMax)
            sb.append('">')
            sb.append(text)
            sb.append('</a></li>')
        }
    }

    private void addTripleDot(StringBuilder sb) {
        sb.append('<li class="page-item"><a class="page-link custom-page-link-dot" href="#" >...</a></li>')
    }

    private void addPagingContainerStart(StringBuilder sb) {
        sb.append('<div class="row my-3">')
        sb.append('<div class="col-12">')
        sb.append('<ul class="pagination mx-auto justify-content-center">')
    }

    private void addPagingContainerEnd(StringBuilder sb) {
        sb.append('</ul></div></div>')

    }

    private void addFirstPage(StringBuilder sb, Integer currentPage, Integer firstPage, Integer max) {
        if (currentPage == firstPage) {
            sb.append('<li class="page-item"><a class="page-link custom-page-link active" href="#" >1</a></li>')
        } else {
            sb.append('<li class="page-item"><a class="page-link custom-page-link" href="/news/index?offset=0&max=')
            sb.append(max)
            sb.append('">1</a></li>')
        }
    }

    private void addLastPage(StringBuilder sb, Integer currentPage, Integer lastPage, Integer total, Integer max) {
        if (currentPage == lastPage) {
            sb.append('<li class="page-item"><a class="page-link custom-page-link active" href="#" >')
            sb.append(lastPage)
            sb.append('</a></li>')
        } else {
            sb.append('<li class="page-item"><a class="page-link custom-page-link" href="/news/index?offset=')
            sb.append((total - total % max))
            sb.append('&max=')
            sb.append(max)
            sb.append('">')
            sb.append(lastPage)
            sb.append('</a></li>')
        }
    }

    private void addLeftAquo(StringBuilder sb, Integer offset, Integer max, Integer currentPage, Integer firstPage) {
        addPage(sb, (offset - max) >= 0 ? offset - max : 0, max, '&laquo;', false, currentPage == firstPage)
    }

    private void addRightAquo(StringBuilder sb, Integer offset, Integer max, Integer total, Integer currentPage, Integer lastPage) {
        addPage(sb, (offset + max) <= total - max ? offset + max : total - max, max, '&raquo;', false, currentPage == lastPage)
    }
}
