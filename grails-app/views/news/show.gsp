<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>${news.name}</title>
    </head>
    <body>
        <div class="row">
            <div class="offset-3"></div>
            <div class="col-6 content pt-3 pb-3">
                <h2 class="text-center pb-3">${news.name}</h2>
                <h5 class="text-center text-muted pb-3"><g:replaceNextLine source="${news.description}"/></h5>
                <div class="row">
                    <div class="col-12">
                        <img class="img-fluid cursor-pointer news-main-photo-show shadow-lg rounded mb-3" src="${createLink(controller: "image", action: "get", params: [id: news.photo.id])}" onclick="showImagePopup('mainPhoto')"/>
                        <div id="mainPhoto" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog custom-modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <img class="img-responsive custom-img-responsive" src="${createLink(controller: "image", action: "get", params: [id: news.photo.id])}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pt-4 pb-4">
                    <div class="col-12 text-justify" id="newsContent">
                        <g:replaceNextLine source="${news.content}"/>
                    </div>
                </div>
                <g:each in="${news.assignedPhotos}" var="assignedPhoto" status="i">
                    <g:if test="${i % 3 == 0}">
                        <div class="row pb-4 align-items-center">
                    </g:if>
                    <div class="col">
                        <img class="img-thumbnail custom-assigned-photo-height" src="${createLink(controller: "image", action: "get", params: [id: assignedPhoto.id])}" onclick="showImagePopup('assignedPhoto${i}')" id="assignedImage${i}"/>
                        <div id="assignedPhoto${i}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog custom-modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <img class="img-responsive custom-img-responsive" src="${createLink(controller: "image", action: "get", params: [id: assignedPhoto.id])}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <g:if test="${i % 3 == 2 || i == news.assignedPhotos.size() - 1}">
                        </div>
                    </g:if>
                </g:each>
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
