<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>SHOW USER</title>
</head>
<body>
    <div class="row">
        <div class="offset-3"></div>
        <div class="col-6 content py-3">
            <div class="row">
                <div class="col">
                    <g:if test="${userRole.role.authority == "ROLE_ADMIN"}">
                        <div class="alert alert-dismissible alert-info">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            Вітаю! Ви будете зареєстровані як адміністратор.
                        </div>
                    </g:if>
                    <h4 class="text-center pb-4">Заповніть форму для реєстрації</h4>
                    <form action="${createLink(controller: 'userRole', action: 'register')}" method="post">
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="form-label" for="userSurname">Прізвище</label>
                                    <input type="text" id="userSurname" class="form-control" name="userName" value="${userRole.user.surname}"/>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label class="form-label" for="userName">Ім'я</label>
                                    <input type="text" id="userName" class="form-control" name="userName" value="${userRole.user.name}"/>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label class="form-label" for="userSecondName">По-батькові</label>
                                    <input type="text" id="userSecondName" class="form-control" name="userName" value="${userRole.user.secondName}"/>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex mb-3">
                            <div class="p-2">Електронна пошта: </div>
                            <div class="p-2">${userRole.user.email}</div>
                            %{--<div class="ml-auto p-2 text-primary">Чи можу я змінити свою пошту?</div>--}%
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="userUsername">Введіть ім'я користувача (логін)</label>
                            <input type="text" class="form-control" id="userUsername" name="username" value="${userRole.user.username}"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="userPassword">Введіть пароль</label>
                            <input type="password" class="form-control" id="userPassword" name="password"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="userPasswordConfirm">Введіть пароль</label>
                            <input type="password" class="form-control" id="userPasswordConfirm"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="offset-3"></div>
    </div>
</body>
</html>