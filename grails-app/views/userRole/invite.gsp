<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Реєстрація</title>
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
                    <form action="${createLink(controller: 'userRole', action: 'register', params: [email: userRole.user.email, authority: userRole.role.authority])}" method="post">
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="form-label" for="userSurname">Прізвище</label>
                                    <input type="text" id="userSurname" class="form-control" name="surname" value="${userRole.user.surname}" required/>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label class="form-label" for="userName">Ім'я</label>
                                    <input type="text" id="userName" class="form-control" name="name" value="${userRole.user.name}" required/>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label class="form-label" for="userSecondName">По-батькові</label>
                                    <input type="text" id="userSecondName" class="form-control" name="secondName" value="${userRole.user.secondName}" required/>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex mb-3">
                            <div class="p-2">Електронна пошта: </div>
                            <div class="p-2">${userRole.user.email}</div>
                        </div>
                        <div class="form-group has-danger">
                            <label class="form-label" for="userRegisterUsername">Введіть ім'я користувача (логін)</label>
                            <input type="text" class="form-control" id="userRegisterUsername" name="username" value="${userRole.user.username}" required/>
                            <div class="invalid-feedback" id="userRegisterUsernameFeedback">Це ім'я користувача вже зайнято.</div>
                        </div>
                        <div class="form-group has-danger">
                            <label class="form-label" for="userRegisterPassword">Введіть пароль</label>
                            <input type="password" class="form-control" id="userRegisterPassword" name="password" required/>
                            <div class="invalid-feedback" id="userRegisterPasswordFeedback">Паролі не співпадають.</div>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="userRegisterPasswordConfirm">Введіть пароль</label>
                            <input type="password" class="form-control" id="userRegisterPasswordConfirm" required/>
                        </div>
                        <button type="submit" class="btn btn-primary" disabled id="registrationBtn">Зареєструватись</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="offset-3"></div>
    </div>
</body>
</html>