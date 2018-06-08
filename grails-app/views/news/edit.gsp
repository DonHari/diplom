<%@ page import="org.apache.tools.ant.util.FileUtils" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Редагування новини "${news.name}"</title>
    </head>
    <body>
        <div class="row">
            <div class="offset-3"></div>
            <div class="col-6 content pt-3 pb-3">
                <form action="${createLink(action: 'update', params: [newsId: news.id])}" method="post" enctype="multipart/form-data">
                    <div class="form-group has-danger has-success">
                        <label class="control-label" for="newsName"><g:message code="news.add.name"/></label>
                        <input class="form-control" type="text" id="newsName" maxlength="50" value="${news.name}" name="name"/>
                        <div class="invalid-feedback"><g:message code="error.notEmpty"/></div>
                        <small id="newsNameLeft" class="form-text text-muted"><g:message code="add.left"/>: 50</small>
                    </div>
                    <div class="form-group mb-3">
                        <label class="control-label" for="newsPhoto"><g:message code="news.add.mainphoto"/></label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input cursor-pointer" id="newsPhoto" accept=".jpg,.jpeg,.png" value="" name="photo" onblur="validatePhotoExtension('#newsPhoto')">
                                <label class="custom-file-label" for="newsPhoto" id="newsPhotoName">${news.photo.fileName}</label>
                                <input type="hidden" value="${news.photo.fileName}" name="photoName" id="newsPhotoHidden"/>
                            </div>
                        </div>
                        <small id="fileHelp" class="form-text text-muted"><g:message code="add.image.help"/></small>
                    </div>
                    <div class="form-group has-danger has-success">
                        <label for="newsDescription"><g:message code="news.add.description"/></label>
                        <textarea class="form-control" id="newsDescription" rows="3" style="margin-top: 0; margin-bottom: 0; height: 129px;" maxlength="200" oninput="newsDescInput()" name="description">${news.description}</textarea>
                        <div class="invalid-feedback"><g:message code="error.notEmpty"/></div>
                        <small id="newsDescriptionLeft" class="form-text text-muted"><g:message code="add.left"/>: 200</small>
                    </div>
                    <div class="form-group has-danger has-success">
                        <label for="newsContent"><g:message code="news.add.content"/></label>
                        <textarea class="form-control" id="newsContent" rows="3" style="margin-top: 0; margin-bottom: 0; height: 129px;" maxlength="5000" name="content">${news.content}</textarea>
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
                                    <input type="hidden" value="${news.assignedPhotos.size()}" id="assignedPhotosCount"/>
                                    <g:each in="${news.assignedPhotos}" var="assignedPhoto" status="i">
                                        <div class="form-group mb-3">
                                            <div class="input-group">
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input cursor-pointer" id="assignedPhoto${i}" accept=".jpg,.jpeg,.png" value="" name="assignedPhoto${i}">
                                                    <label class="custom-file-label" for="assignedPhoto${i}" id="assignedPhoto${i}Name">${assignedPhoto.fileName}</label>
                                                    <input type="hidden" value="${assignedPhoto.fileName}" name="assignedPhoto${i}Name" id="assignedPhoto${i}Hidden"/>
                                                    <script>
                                                        document.onreadystatechange = function () {
                                                            if (document.readyState === "completed") {
                                                                $("#assignedPhoto${i}").on({
                                                                    input: function () {
                                                                        console.log('input');
                                                                        var fileName = fileInput(this.id);
                                                                        console.log(fileName);
                                                                        if (validatePhotoExtension(fileName)) {
                                                                            $("#assignedPhoto${i}Name").text(fileName);
                                                                        } else {
                                                                            $(this).val("");
                                                                        }
                                                                    }, change: function () {
                                                                        console.log('change');
                                                                        var fileName = fileInput(this.id);
                                                                        console.log(fileName);
                                                                        if (validatePhotoExtension(fileName)) {
                                                                            $("#assignedPhoto${i}Name").text(fileName);
                                                                        } else {
                                                                            $(this).val("");
                                                                        }
                                                                    }
                                                                });
                                                            }
                                                        };
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                    </g:each>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Оновити</button>
                    <button type="button" class="btn btn-primary" onclick="addEditAssignedPhoto()" id="addAssignedPhotoBtn"><g:message code="news.add.assignedPhoto.add"/></button>
                </form>
            </div>
            <div class="offset-3"></div>
        </div>
    </body>
</html>
