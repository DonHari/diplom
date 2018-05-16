<!doctype html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="header.news"/></title>
    </head>
    <body>
        <div class="row">
            <div class="offset-2"></div>
            <div class="col-8 content">
                <g:each in="${newsList}" var="news" status="i">
                    <div class="row news-item">
                        <div class="col-5">
                            <img class="card-img news-main-photo" src="${createLink(controller: "image", action: "get", params: [id: news.photo.id])}" alt="${message(code:'image.cant.upload',default:"Can't upload an image.")}"/>
                        </div>
                        <div class="col-7 pl-4 pr-4">
                            <div class="row h-30">
                                <h3>
                                    <a href="${createLink(controller: 'news', action: 'show', params:[id: news.id])}">${news.name}</a>
                                </h3>
                            </div>
                            <div class="row h-10">
                                <div class="col-12 col-md-12">${news.description}</div>
                            </div>
                            <div class="row align-items-end h-60" >
                                <div class="col-4 text-left text-muted"><g:dateFormat format="dd-MM-yyyy HH:mm" date="${news.dateCreated}"/></div>
                                <div class="offset-4"></div>
                                <div class="col-4 text-right text-muted">${news.author.getFullName()}</div>
                            </div>
                        </div>
                    </div>
                    <g:if test="${i != newsList.size()-1}">
                        <hr class="news-divider"/>
                    </g:if>
                </g:each>
                <div class="pagination">
                    <g:paginate total="${newsCount ?: 0}" max="${maxPerPage}"/>
                </div>
            </div>
            <div class="offset-2"></div>
        </div>
    </body>
</html>
