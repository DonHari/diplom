<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="news.add.title" default="Creating news"/></title>
    </head>
    <body>
        <div class="row">
            <div class="offset-3"></div>
            <div class="col-6 content pt-3 pb-3">
                <div class="row">
                    <div class="col-12" id="newsError">
                        %{--error here--}%
                    </div>
                </div>
                <form action="${createLink(action: 'save')}" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="control-label" for="newsName">Заголовок новости</label>
                        <input class="form-control" type="text" id="newsName" maxlength="50" oninput="newsNameInput()" value="${name}" name="name" onblur="validateNewsNameInput()"/>
                        <small id="newsNameLeft" class="form-text text-muted">Осталось символов: 50</small>
                    </div>
                    <div class="form-group mb-3">
                        <label class="control-label" for="newsPhoto">Главная фотография</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input cursor-pointer" id="newsPhoto" oninput="fileInput('newsPhoto')" accept=".jpg,.jpeg,.png" value="${photo}" name="photo" onblur="validatePhotoExtension('#newsPhoto')">
                                <label class="custom-file-label" for="newsPhoto" id="newsPhotoName">Выберите файл</label>
                            </div>
                        </div>
                        <small id="fileHelp" class="form-text text-muted">Поддерживаются изображения с расширением .jpg, .png, .jpeg. Рекомендуется разрешение 1200х300 пикселей</small>
                    </div>
                    <div class="form-group">
                        <label for="descNews">Краткое описание</label>
                        <textarea class="form-control" id="descNews" rows="3" style="margin-top: 0; margin-bottom: 0; height: 129px;" maxlength="200" oninput="newsDescInput()" name="description">${description}</textarea>
                        <small id="descNewsLeft" class="form-text text-muted">Осталось символов: 200</small>
                    </div>
                    <div class="form-group">
                        <label for="newsContent">Содержание новости</label>
                        <textarea class="form-control" id="newsContent" rows="3" style="margin-top: 0; margin-bottom: 0; height: 129px;" maxlength="5000" oninput="newsContentInput()" name="content">${content}</textarea>
                        <small id="newsContentLeft" class="form-text text-muted">Осталось символов: 5000</small>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-12 text-center">
                                    <h4>Фотографии в конце новости</h4>
                                    <small class="form-text text-muted">Рекомендуется, чтобы количество фотографий было кратно трем. Поддерживаются изображения с расширением .jpg, .png, .jpeg. Рекомендуется разрешение 1200х300 пикселей</small>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12" id="assignedPhotos">
                                    <input type="hidden" value="1" id="assignedPhotosCount"/>
                                    <div class="form-group mb-3">
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input cursor-pointer" id="assignedPhoto1" oninput="fileInput('assignedPhoto1')" accept=".jpg,.jpeg,.png" value="${photo}" name="assignedPhoto1" onblur="validatePhotoExtension('#assignedPhoto1')">
                                                <label class="custom-file-label" for="assignedPhoto1" id="assignedPhoto1Name">Выберите файл</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Создать</button>
                    <button type="button" class="btn btn-primary" onclick="addAssignedPhoto()" id="addAssignedPhotoBtn">Добавить фотографию</button>
                </form>
            </div>
            <div class="offset-3"></div>
        </div>
    </body>
</html>
