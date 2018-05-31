<!doctype html>
<html>
<head>
    <title>Інформація про мене</title>
    <meta name="layout" content="main">
</head>
<body>
    <div class="row">
        <div class="offset-3"></div>
        <div class="col-6 content pt-3 pb-3">
            <g:if test="${justSaved}">
                <div class="alert alert-dismissible alert-success">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    Ви успішно оновили інформацію про себе!
                </div>
            </g:if>
            <g:else>
                <g:if test="${errorOccurred}">
                    <div class="alert alert-dismissible alert-danger">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        ${errorMessage}
                    </div>
                </g:if>
            </g:else>
                <g:if test="${activeTab == 'updateLogin'}">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link custom-nav-link" data-toggle="tab" href="#myMainInfo">Основна інформація</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link custom-nav-link active" data-toggle="tab" href="#userNameChange">Редагування імені користувача</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link custom-nav-link" data-toggle="tab" href="#passwordChange">Редагування паролю</a>
                        </li>
                    </ul>
                    <div id="myTabContent" class="tab-content p-3">
                        <div class="tab-pane fade" id="myMainInfo">
                            <form action="${createLink(action: 'updateMyself', params: [oldRoleId: userRole.role.id])}" method="post">
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
                                            <input type="text" class="form-control" id="userSecondName" value="${userRole.user.secondName}" name="secondName" disabled=""/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="userEmail" class="form-label">Електрона пошта</label>
                                    <input type="text" class="form-control" id="userEmail" value="${userRole.user.email}" name="email" disabled=""/>
                                </div>
                                <g:if test="${userRole.role.authority == "ROLE_USER"}">
                                    <div class="form-group">
                                        <label class="form-label">Роль у системі</label>
                                        <input type="text" class="form-control" value="${resolveRoleAuthority(authority: userRole.role.authority)}" disabled/>
                                        <input type="hidden" value="${userRole.role.id}" name="newRoleId"/>
                                    </div>
                                </g:if>
                                <g:else>
                                    <div class="form-group">
                                        <label for="userRoleSelect" class="form-label">Роль у системі</label>
                                        <select class="form-control" id="userRoleSelect" name="newRoleId" disabled="">
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
                                </g:else>
                                <button type="submit" class="btn btn-primary" id="userConfirmButton" disabled="">Зберігти</button>
                                <button type="button" class="btn btn-primary" id="userEnableEditButton">Включити редагування</button>
                            </form>
                        </div>
                        <div class="tab-pane fade show active" id="userNameChange">
                            <div class="row">
                                <div class="col-5">Поточне ім'я користувача</div>
                                <div class="col-6">${userRole.user.username}</div>
                            </div>
                            <hr class="mt-3 mb-3" width="100%" color="#7b8a8b"/>
                            <form action="${createLink(action: 'updateLogin', params: [userId: userRole.userId])}" method="post">
                                <div class="form-group has-error">
                                    <label class="form-label" for="userUsername">Нове ім'я користувача</label>
                                    <input type="text" class="form-control" id="userUsername" name="newUsername"/>
                                    <div class="invalid-feedback">Ім'я користувача повинно складатись не менше ніж з чотирьох символів</div>
                                </div>
                                <div class="form-group has-error">
                                    <label class="form-label" for="userPasswordForUsernameEdit">Введіть пароль</label>
                                    <input type="password" class="form-control" id="userPasswordForUsernameEdit" name="password"/>
                                    <div class="invalid-feedback">Пароль повинен складатись не менше ніж з чотирьох символів</div>
                                </div>
                                <input type="submit" class="btn btn-primary" id="usernameEditSubmit" disabled value="Підтвердити зміну імені користувача"/>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="passwordChange">
                            <form action="${createLink(action: 'updatePassword', params: [userId: userRole.userId])}" method="post">
                                <div class="form-group">
                                    <div class="form-group has-error">
                                        <label class="form-label" for="newPasswordEdit">Новий пароль</label>
                                        <input type="password" class="form-control" id="newPasswordEdit" name="newPassword"/>
                                        <div class="invalid-feedback">Пароль повинен складатись не менше ніж з чотирьох символів</div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-group has-error">
                                        <label class="form-label" for="newPasswordEditConfirm">Підтвердіть новий пароль</label>
                                        <input type="password" class="form-control" id="newPasswordEditConfirm"/>
                                        <div class="invalid-feedback">Паролі не співпадають!</div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-group has-error">
                                        <label class="form-label" for="userPasswordForPasswordEdit">Поточний пароль</label>
                                        <input type="password" class="form-control" id="userPasswordForPasswordEdit" name="password"/>
                                        <div class="invalid-feedback">Пароль повинен складатись не менше ніж з чотирьох символів</div>
                                    </div>
                                </div>
                                <input type="submit" id="passwordEditSubmit" class="btn btn-primary" disabled value="Підтвердити зміну паролю"/>
                            </form>
                        </div>
                    </div>
                </g:if>
                <g:else>
                    <g:if test="${activeTab == 'updatePassword'}">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link custom-nav-link" data-toggle="tab" href="#myMainInfo">Основна інформація</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link custom-nav-link" data-toggle="tab" href="#userNameChange">Редагування імені користувача</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link custom-nav-link  active" data-toggle="tab" href="#passwordChange">Редагування паролю</a>
                            </li>
                        </ul>
                        <div id="myTabContent" class="tab-content p-3">
                            <div class="tab-pane fade" id="myMainInfo">
                                <form action="${createLink(action: 'updateMyself', params: [oldRoleId: userRole.role.id])}" method="post">
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
                                                <input type="text" class="form-control" id="userSecondName" value="${userRole.user.secondName}" name="secondName" disabled=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="userEmail" class="form-label">Електрона пошта</label>
                                        <input type="text" class="form-control" id="userEmail" value="${userRole.user.email}" name="email" disabled=""/>
                                    </div>
                                    <g:if test="${userRole.role.authority == "ROLE_USER"}">
                                        <div class="form-group">
                                            <label class="form-label">Роль у системі</label>
                                            <input type="text" class="form-control" value="${resolveRoleAuthority(authority: userRole.role.authority)}" disabled/>
                                            <input type="hidden" value="${userRole.role.id}" name="newRoleId"/>
                                        </div>
                                    </g:if>
                                    <g:else>
                                        <div class="form-group">
                                            <label for="userRoleSelect" class="form-label">Роль у системі</label>
                                            <select class="form-control" id="userRoleSelect" name="newRoleId" disabled="">
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
                                    </g:else>
                                    <button type="submit" class="btn btn-primary" id="userConfirmButton" disabled="">Зберігти</button>
                                    <button type="button" class="btn btn-primary" id="userEnableEditButton">Включити редагування</button>
                                </form>
                            </div>
                            <div class="tab-pane fade show active" id="userNameChange">
                                <div class="row">
                                    <div class="col-5">Поточне ім'я користувача</div>
                                    <div class="col-6">${userRole.user.username}</div>
                                </div>
                                <hr class="mt-3 mb-3" width="100%" color="#7b8a8b"/>
                                <form action="${createLink(action: 'updateLogin', params: [userId: userRole.userId])}" method="post">
                                    <div class="form-group has-error">
                                        <label class="form-label" for="userUsername">Нове ім'я користувача</label>
                                        <input type="text" class="form-control" id="userUsername" name="newUsername"/>
                                        <div class="invalid-feedback">Ім'я користувача повинно складатись не менше ніж з чотирьох символів</div>
                                    </div>
                                    <div class="form-group has-error">
                                        <label class="form-label" for="userPasswordForUsernameEdit">Введіть пароль</label>
                                        <input type="password" class="form-control" id="userPasswordForUsernameEdit" name="password"/>
                                        <div class="invalid-feedback">Пароль повинен складатись не менше ніж з чотирьох символів</div>
                                    </div>
                                    <input type="submit" class="btn btn-primary" id="usernameEditSubmit" disabled value="Підтвердити зміну імені користувача"/>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="passwordChange">
                                <form action="${createLink(action: 'updatePassword', params: [userId: userRole.userId])}" method="post">
                                    <div class="form-group">
                                        <div class="form-group has-error">
                                            <label class="form-label" for="newPasswordEdit">Новий пароль</label>
                                            <input type="password" class="form-control" id="newPasswordEdit" name="newPassword"/>
                                            <div class="invalid-feedback">Пароль повинен складатись не менше ніж з чотирьох символів</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group has-error">
                                            <label class="form-label" for="newPasswordEditConfirm">Підтвердіть новий пароль</label>
                                            <input type="password" class="form-control" id="newPasswordEditConfirm"/>
                                            <div class="invalid-feedback">Паролі не співпадають!</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group has-error">
                                            <label class="form-label" for="userPasswordForPasswordEdit">Поточний пароль</label>
                                            <input type="password" class="form-control" id="userPasswordForPasswordEdit" name="password"/>
                                            <div class="invalid-feedback">Пароль повинен складатись не менше ніж з чотирьох символів</div>
                                        </div>
                                    </div>
                                    <input type="submit" id="passwordEditSubmit" class="btn btn-primary" disabled value="Підтвердити зміну паролю"/>
                                </form>
                            </div>
                        </div>
                    </g:if>
                    <g:else>
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link custom-nav-link active" data-toggle="tab" href="#myMainInfo">Основна інформація</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link custom-nav-link" data-toggle="tab" href="#userNameChange">Редагування імені користувача</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link custom-nav-link" data-toggle="tab" href="#passwordChange">Редагування паролю</a>
                            </li>
                        </ul>
                        <div id="myTabContent" class="tab-content p-3">
                            <div class="tab-pane fade show active" id="myMainInfo">
                                <form action="${createLink(action: 'updateMyself', params: [oldRoleId: userRole.role.id])}" method="post">
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
                                                <input type="text" class="form-control" id="userSecondName" value="${userRole.user.secondName}" name="secondName" disabled=""/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="userEmail" class="form-label">Електрона пошта</label>
                                        <input type="text" class="form-control" id="userEmail" value="${userRole.user.email}" name="email" disabled=""/>
                                    </div>
                                    <g:if test="${userRole.role.authority == "ROLE_USER"}">
                                        <div class="form-group">
                                            <label class="form-label">Роль у системі</label>
                                            <input type="text" class="form-control" value="${resolveRoleAuthority(authority: userRole.role.authority)}" disabled/>
                                            <input type="hidden" value="${userRole.role.id}" name="newRoleId"/>
                                        </div>
                                    </g:if>
                                    <g:else>
                                        <div class="form-group">
                                            <label for="userRoleSelect" class="form-label">Роль у системі</label>
                                            <select class="form-control" id="userRoleSelect" name="newRoleId" disabled="">
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
                                    </g:else>
                                    <button type="submit" class="btn btn-primary" id="userConfirmButton" disabled="">Зберігти</button>
                                    <button type="button" class="btn btn-primary" id="userEnableEditButton">Включити редагування</button>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="userNameChange">
                                <div class="row">
                                    <div class="col-5">Поточне ім'я користувача</div>
                                    <div class="col-6">${userRole.user.username}</div>
                                </div>
                                <hr class="mt-3 mb-3" width="100%" color="#7b8a8b"/>
                                <form action="${createLink(action: 'updateLogin', params: [userId: userRole.userId])}" method="post">
                                    <div class="form-group has-error">
                                        <label class="form-label" for="userUsername">Нове ім'я користувача</label>
                                        <input type="text" class="form-control" id="userUsername" name="newUsername"/>
                                        <div class="invalid-feedback">Ім'я користувача повинно складатись не менше ніж з чотирьох символів</div>
                                    </div>
                                    <div class="form-group has-error">
                                        <label class="form-label" for="userPasswordForUsernameEdit">Введіть пароль</label>
                                        <input type="password" class="form-control" id="userPasswordForUsernameEdit" name="password"/>
                                        <div class="invalid-feedback">Пароль повинен складатись не менше ніж з чотирьох символів</div>
                                    </div>
                                    <input type="submit" class="btn btn-primary" id="usernameEditSubmit" disabled value="Підтвердити зміну імені користувача"/>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="passwordChange">
                                <form action="${createLink(action: 'updatePassword', params: [userId: userRole.userId])}" method="post">
                                    <div class="form-group">
                                        <div class="form-group has-error">
                                            <label class="form-label" for="newPasswordEdit">Новий пароль</label>
                                            <input type="password" class="form-control" id="newPasswordEdit" name="newPassword"/>
                                            <div class="invalid-feedback">Пароль повинен складатись не менше ніж з чотирьох символів</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group has-error">
                                            <label class="form-label" for="newPasswordEditConfirm">Підтвердіть новий пароль</label>
                                            <input type="password" class="form-control" id="newPasswordEditConfirm"/>
                                            <div class="invalid-feedback">Паролі не співпадають!</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group has-error">
                                            <label class="form-label" for="userPasswordForPasswordEdit">Поточний пароль</label>
                                            <input type="password" class="form-control" id="userPasswordForPasswordEdit" name="password"/>
                                            <div class="invalid-feedback">Пароль повинен складатись не менше ніж з чотирьох символів</div>
                                        </div>
                                    </div>
                                    <input type="submit" id="passwordEditSubmit" class="btn btn-primary" disabled value="Підтвердити зміну паролю"/>
                                </form>
                            </div>
                        </div>
                    </g:else>
                </g:else>
            </div>
        <div class="offset-3"></div>
    </div>
</body>
</html>