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
                <a href="${createLink(controller: 'userRole', action: 'show', params: [userRole: userRole])}">
                    <g:if test="${i % 2 == 0}">
                        <tr class="table-primary cursor-pointer clickable-row" data-href="${createLink(url: '/userRole/show/' + userRole.id)}">
                    </g:if>
                    <g:else>
                        <tr class="table-secondary cursor-pointer clickable-row" data-href="${createLink(controller: 'userRole', action: 'show', params: [id: userRole.id])}">
                    </g:else>
                    <td>${userRole.user.surname}</td>
                    <td>${userRole.user.name}</td>
                    <td>${userRole.user.secondName}</td>
                    <td><g:resolveRoleAuthority authority="${userRole.role.authority}"/></td>
                </tr>
                </a>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="offset-3"></div>
</div>
</body>
</html>
