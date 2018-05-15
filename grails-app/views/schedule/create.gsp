<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="header.user.add.schedule"/></title>
    </head>
    <body>
        <div class="row">
            <div class="offset-3"></div>
            <div class="col-6 content pt-3 pb-3">
                <g:if test="${justSaved}">
                    <div class="alert alert-dismissible alert-success">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <g:message code="schedule.saved.message" default="Ви успішно додали новий розклад!"/>
                    </div>
                </g:if>
                <form action="${createLink(action: 'save')}" method="post" enctype="multipart/form-data" onsubmit="return checkIfScheduleExists()" id="scheduleForm">
                    <div class="row">
                        <div class="col-5">
                            <div class="form-group">
                                <label for="tetrameterSelect"><g:message code="schedule.add.tetrameter"/></label>
                                <select class="form-control" id="tetrameterSelect" name="tetrameter">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>
                            </div>
                        </div>
                        <div class="offset-2"></div>
                        <div class="col-5">
                            <div class="form-group has-danger has-success">
                                <label class="control-label" for="scheduleYear"><g:message code="schedule.add.year"/></label>
                                <input class="form-control" type="number" id="scheduleYear" maxlength="50" value="${year ?: 2018}" name="year" onblur="" min="2018" max="2030"/>
                                <div class="invalid-feedback"><g:message code="error.wrongYear"/></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-3">
                        <label class="control-label" for="scheduleFile"><g:message code="schedule.add.file"/></label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input cursor-pointer has-danger has-success" id="scheduleFile" accept=".xls,.xlsx,.csv" value="${fileName}" name="uploadedFile">
                                <label class="custom-file-label" for="scheduleFile" id="scheduleFileName"><g:message code="add.file.placeholder"/></label>
                            </div>
                        </div>
                        <small id="fileHelp" class="form-text text-muted"><g:message code="add.excel.help"/></small>
                    </div>
                    <button type="submit" class="btn btn-primary disabled" id="scheduleSaveButton">Создать</button>
                </form>
            </div>
            <div class="offset-3"></div>
        </div>
    </body>
</html>
