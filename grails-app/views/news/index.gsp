<!doctype html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="header.news" default="News"/></title>
    </head>
    <body>
        <div class="row">
            <div class="offset-2"></div>
            <div class="col-8 content">
                <g:each in="${newsList}" var="news" status="i">
                    <div class="row news-item">
                        <div class="col-4">
                            <img  class="card-img" src="${createLink(controller: "image", action: "get", params: [id: news.photo.id])}" alt="${message(code:'image.cant.upload',default:"Can't upload an image.")}"/>
                        </div>
                        <div class="col-8 pl-4 pr-4 flex-column">
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
