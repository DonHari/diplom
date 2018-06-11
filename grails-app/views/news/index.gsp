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
                <g:if test="${justRegistered}">
                    <div class="alert alert-dismissible alert-success mt-3 max-width-1000px mx-auto">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <p class="">Ви успішно зареєструвались!</p>
                        <p class="">Ви вже можете користуватись своїм обліковим записом. Для початку бажано авторизуватись та переглянути інструкціі.</p>
                        <p class="">Гарного дня!</p>
                    </div>
                </g:if>
                <g:each in="${newsList}" var="news" status="i">
                    <div class="row news-item">
                        <div class="col-5">
                            <img class="card-img news-main-photo" src="${createLink(controller: "image", action: "get", params: [id: news.photo.id])}" alt="${message(code:'image.cant.upload',default:"Can't upload an image.")}"/>
                        </div>
                        <div class="col-7 pl-4 pr-4">
                            <div class="row justify-content-between h-40">
                                <div class="col-auto px-0 custom-max-width-75-percent">
                                    <h3>
                                        <a href="${createLink(controller: 'news', action: 'show', params:[id: news.id])}">
                                            ${news.name}
                                        </a>
                                    </h3>
                                </div>
                                <div class="col-3">
                                    <g:if test="${news.dateCreated < news.lastUpdated}">
                                        <div class="row px-1">
                                            <span class="badge badge-info ml-auto">Оновлено</span>
                                        </div>
                                        <div class="row px-1 pt-1">
                                            <sec:ifLoggedIn>
                                                <g:if test="${news.author.id == sec.loggedInUserInfo(field: 'id')?.asType(Long)}">
                                                    <span class="badge badge-info ml-auto"><a href="/news/edit/${news.id}" class="custom-edit-badge-link">Можна редагувати</a></span>
                                                </g:if>
                                                <g:else>
                                                    <sec:ifAllGranted roles="ROLE_ADMIN">
                                                        <span class="badge badge-info ml-auto "><a href="/news/edit/${news.id}" class="custom-edit-badge-link">Можна редагувати</a></span>
                                                    </sec:ifAllGranted>
                                                </g:else>
                                            </sec:ifLoggedIn>
                                        </div>
                                    </g:if>
                                    <g:else>
                                        <div class="row px-1">
                                            <sec:ifLoggedIn>
                                                <g:if test="${news.author.id == sec.loggedInUserInfo(field: 'id')?.asType(Long)}">
                                                    <span class="badge badge-info ml-auto"><a href="/news/edit/${news.id}" class="custom-edit-badge-link">Можна редагувати</a></span>
                                                </g:if>
                                                <g:else>
                                                    <sec:ifAllGranted roles="ROLE_ADMIN">
                                                        <span class="badge badge-info ml-auto"><a href="/news/edit/${news.id}" class="custom-edit-badge-link">Можна редагувати</a></span>
                                                    </sec:ifAllGranted>
                                                </g:else>
                                            </sec:ifLoggedIn>
                                        </div>
                                    </g:else>
                                </div>
                            </div>
                            <div class="row h-40  pt-3">
                                <div class="col-12 col-md-12 text-justify"><g:replaceNextLineForDescription source="${news.description}"/></div>
                            </div>
                            <div class="row justify-content-between align-items-end h-20" >
                                        <div class="col-auto text-left text-muted pr-1" data-toggle="tooltip" data-placement="bottom" data-html="true" title="${tooltipDates(format:'dd-MM-yyyy HH:mm', updateDate: news.lastUpdated, createDate: news.dateCreated)}">
                                            <g:dateFormat format="dd-MM-yyyy HH:mm" date="${news.dateCreated}"/>
                                        </div>
                                <div class="col text-right text-muted" data-toggle="tooltip" data-placement="right" data-html="true" title="${news.author.fullName}">${news.author.abbreviatedName}</div>
                            </div>
                        </div>
                    </div>
                    <g:if test="${i != newsList.size()-1}">
                        <hr class="news-divider custom-divider"/>
                    </g:if>
                </g:each>
                <g:customPagination total="${newsCount ?: 0}" max="${maxPerPage}"/>
            </div>
            <div class="offset-2"></div>
        </div>
    </body>
</html>
