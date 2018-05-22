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
