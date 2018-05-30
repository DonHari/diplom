<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="header.user.managing"/></title>
</head>
<body>
<div class="row">
    <div class="offset-3"></div>

    <div class="col-6 content pt-3 pb-3">
        <div class="row pb-3">
            <div class="col">
                <g:if test="${justInvited}">
                    <div class="alert alert-dismissible alert-success">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        Ви успішно додали користувача. Через декілька хвилин він отримає лист та зможе зареєструватись!
                    </div>
                </g:if>

                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#inviteUserModal">
                    Додати користувача
                </button>

                %{--invite modal--}%
                <div class="modal fade" id="inviteUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Заповніть форму нижче, щоб відправити запрошення</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="${createLink(controller: 'mail', action: 'inviteUser')}">
                                    <div class="form-group">
                                        <label class="form-label" for="userInviteEmail">Електронна пошта</label>
                                        <input type="email" class="form-control" id="userInviteEmail" name="userEmail" required title="Електрона пошта вказана неправильно!"/>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label" for="userInviteRole">Роль у системі</label>
                                        <select class="form-control" id="userInviteRole" name="authority">
                                            <g:each in="${roleList}" var="role">
                                                <option value="${role.authority}"><g:resolveRoleAuthority authority="${role.authority}"/></option>
                                            </g:each>
                                        </select>
                                    </div>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрити вікно</button>
                                    <button type="submit" class="btn btn-primary">Відправити запрошення</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">Прізвище</th>
                <th scope="col">Ім'я</th>
                <th scope="col">По-батькові</th>
                <th scope="col">Роль</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${userRoleList}" var="userRole" status="i">
                    <g:if test="${sec.loggedInUserInfo(field: 'id') as Long == userRole.user.id}">
                        <tr class="table-secondary cursor-pointer clickable-row" data-href="${createLink(controller: 'userRole', action: 'showMe')}">
                    </g:if>
                    <g:else>
                        <tr class="table cursor-pointer clickable-row" data-href="${createLink(controller: 'userRole', action: 'show', params:[userId: userRole.user.id, roleId: userRole.role.id])}">
                    </g:else>
                    <td>${userRole.user.surname}</td>
                    <td>${userRole.user.name}</td>
                    <td>${userRole.user.secondName}</td>
                    <td><g:resolveRoleAuthority authority="${userRole.role.authority}"/></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="offset-3"></div>
</div>
</body>
</html>
