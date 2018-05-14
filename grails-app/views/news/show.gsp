<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'news.label', default: 'News')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="row">
            <div class="offset-3"></div>
            <div class="col-6 content pt-3 pb-3">
                <h2 class="text-center pb-3">${news.name}</h2>
                <div class="row">
                    <div class="col-6">
                        <img class="img-fluid" src="${createLink(controller: "image", action: "get", params: [id: news.photo.id])}"/>
                    </div>
                    <div class="col-6">
                        ${news.description}
                    </div>
                </div>
                <div class="row pt-4 pb-4">
                    <div class="col-12">
                        ${news.content}
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 text-muted text-left"><g:dateFormat format="dd-MM-yyyy HH:mm" date="${news.dateCreated}"/></div>
                    <div class="offset-4"></div>
                    <div class="col-4 text-muted text-right">${news.author.getFullName()}</div>
                </div>
            </div>
            <div class="offset-3"></div>
        </div>
    </body>
</html>
