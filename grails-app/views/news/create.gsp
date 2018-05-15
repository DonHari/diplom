<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="header.user.add.news"/></title>
    </head>
    <body>
        <div class="row">
            <div class="offset-3"></div>
            <div class="col-6 content pt-3 pb-3">
                <form action="${createLink(action: 'save')}" method="post" enctype="multipart/form-data" onsubmit="return checkNewsFields()">
                    <div class="form-group has-danger has-success">
                        <label class="control-label" for="newsName"><g:message code="news.add.name"/></label>
                        <input class="form-control" type="text" id="newsName" maxlength="50" value="${name}" name="name"/>
                        <div class="invalid-feedback"><g:message code="error.notEmpty"/></div>
                        <small id="newsNameLeft" class="form-text text-muted"><g:message code="add.left"/>: 50</small>
                    </div>
                    <div class="form-group mb-3">
                        <label class="control-label" for="newsPhoto"><g:message code="news.add.mainphoto"/></label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input cursor-pointer" id="newsPhoto" %{--oninput="fileInput('newsPhoto')"--}% accept=".jpg,.jpeg,.png" value="${photo}" name="photo" onblur="validatePhotoExtension('#newsPhoto')">
                                <label class="custom-file-label" for="newsPhoto" id="newsPhotoName"><g:message code="add.file.placeholder"/></label>
                            </div>
                        </div>
                        <small id="fileHelp" class="form-text text-muted"><g:message code="add.image.help"/></small>
                    </div>
                    <div class="form-group has-danger has-success">
                        <label for="newsDescription"><g:message code="news.add.description"/></label>
                        <textarea class="form-control" id="newsDescription" rows="3" style="margin-top: 0; margin-bottom: 0; height: 129px;" maxlength="200" oninput="newsDescInput()" name="description">${description}</textarea>
                        <div class="invalid-feedback"><g:message code="error.notEmpty"/></div>
                        <small id="newsDescriptionLeft" class="form-text text-muted"><g:message code="add.left"/>: 200</small>
                    </div>
                    <div class="form-group has-danger has-success">
                        <label for="newsContent"><g:message code="news.add.content"/></label>
                        <textarea class="form-control" id="newsContent" rows="3" style="margin-top: 0; margin-bottom: 0; height: 129px;" maxlength="5000" name="content">${content}</textarea>
                        <div class="invalid-feedback"><g:message code="error.notEmpty"/></div>
                        <small id="newsContentLeft" class="form-text text-muted"><g:message code="add.left"/>: 5000</small>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-12 text-center">
                                    <h4><g:message code="news.add.assignedPhoto"/></h4>
                                    <small class="form-text text-muted"><g:message code="news.add.assignedPhoto.help"/></small>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12" id="assignedPhotos">
                                    <input type="hidden" value="1" id="assignedPhotosCount"/>
                                    <div class="form-group mb-3">
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input cursor-pointer" id="assignedPhoto1" oninput="fileInput('assignedPhoto1')" accept=".jpg,.jpeg,.png" value="${photo}" name="assignedPhoto1" onblur="validatePhotoExtension('#assignedPhoto1')">
                                                <label class="custom-file-label" for="assignedPhoto1" id="assignedPhoto1Name"><g:message code="add.file.placeholder"/></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary disabled" id="newsSendButton"><g:message code="add.confirm"/></button>
                    <button type="button" class="btn btn-primary" onclick="addAssignedPhoto()" id="addAssignedPhotoBtn"><g:message code="news.add.assignedPhoto.add"/></button>
                </form>
            </div>
            <div class="offset-3"></div>
        </div>
    </body>
</html>
