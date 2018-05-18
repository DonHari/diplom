<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>SHOW USER</title>
    </head>
    <body>
        <div class="row">
            <div class="offset-3"></div>
            <div class="col-6 content pt-3 pb-3">
                <g:if test="${justSaved}">
                    <div class="alert alert-dismissible alert-success">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        Ви успішно оновили інформацію про користувача!
                        <script>
                            $(document).ready(function () {
                                $('#faqQuestion').val('');
                                $('#faqAnswer').val('');
                            });
                        </script>
                    </div>
                </g:if>
                <form action="${createLink(action: 'save', params: ['userRole.user.id': userRole.user.id, oldRoleId: userRole.role.id])}" method="post">
                    <div class="row">
                        <div class="col-4">
                            <div class="form-group">
                                <label for="userSurname" class="form-label">Фамілія</label>
                                <input type="text" class="form-control" id="userSurname" value="${userRole.user.surname}" name="surname" disabled=""/>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label for="userName" class="form-label">Ім'я</label>
                                <input type="text" class="form-control" id="userName" value="${userRole.user.name}" name="name" disabled=""/>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label for="userSecondName" class="form-label">По-батькові</label>
                                <input type="text" class="form-control" id="userSecondName" value="${userRole.user.secondName}" name="name" disabled=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userEmail" class="form-label">Електрона пошта</label>
                        <input type="text" class="form-control" id="userEmail" value="${userRole.user.email}" name="email" disabled=""/>
                    </div>
                    <div class="form-group">
                        <label for="userRoleSelect" class="form-label">Роль у системі</label>
                        <select class="form-control" id="userRoleSelect" name="userRole.role.id" disabled="">
                            <g:each in="${availableRoles}" var="availableRole">
                                <g:if test="${availableRole.authority == userRole.role.authority}">
                                    <option selected value="${availableRole.id}">${resolveRoleAuthority(authority: availableRole.authority)}</option>
                                </g:if>
                                <g:else>
                                    <option value="${availableRole.id}">${resolveRoleAuthority(authority: availableRole.authority)}</option>
                                </g:else>
                            </g:each>
                        </select>
                    </div>
                    <div class="form-group">
                        <g:prepareCheckbox message="Обликовий запис активний" checked="${userRole.user.enabled}" disabled="true" id="userEnabledCheckbox" name="enabled"/>
                        <g:prepareCheckbox message="Обликовий запис заблокований" checked="${userRole.user.accountLocked}" disabled="true" id="userAccountLockedCheckbox" name="accountLocked"/>
                        <g:prepareCheckbox message="Вийшов строк гідності облікового запису" checked="${userRole.user.accountExpired}" disabled="true" id="userAccountExpiredCheckbox" name="accountExpired"/>
                        <g:prepareCheckbox message="Вийшов строк гідності паролю" checked="${userRole.user.passwordExpired}" disabled="true" id="userPasswordExpiredCheckbox" name="passwordExpired"/>
                    </div>
                    <button type="submit" class="btn btn-primary" id="userConfirmButton" disabled=""><g:message code="add.confirm"/></button>
                    <button type="button" class="btn btn-primary" id="userEnableEditButton">Включити редагування</button>
                </form>
            </div>
            <div class="offset-3"></div>
        </div>
    </body>
</html>
