<!doctype html>
<html lang="uk" class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><g:layoutTitle default="Grails"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <asset:stylesheet src="application.css"/>
        <asset:javascript src="application.js"/>
        <g:layoutHead/>
    </head>
    <body onload="layoutLoaded()">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="/">
                <img class="custom-logo" src="${assetPath(src:'/site_logo.png')}">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor01">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item" id="newsHeader">
                        <a class="nav-link" href="/" ><g:message code="header.news"/></a>
                    </li>
                    <li class="nav-item" id="enrolleeHeader">
                        <a class="nav-link" href="/enrollee"><g:message code="header.enrollee"/></a>
                    </li>
                    <li class="nav-item" id="studentsHeader">
                        <a class="nav-link" href="/students"><g:message code="header.student"/></a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <sec:ifNotLoggedIn>
                        <li class="nav-item ml-5" id="authorize">
                            <a class="nav-link" href="#login" data-toggle="modal" data-target="#loginForm"><g:message code="header.auth.signin"/></a>
                            <div class="modal" tabindex="-1" role="dialog" id="loginForm">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Авторизація</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body" id="loginFormBody">
                                            <g:include controller="login" action="auth"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </sec:ifNotLoggedIn>
                    <sec:ifLoggedIn>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <div class="btn-group ml-5">
                                <input type="button" class="btn btn-primary" value="${message(code: "header.auth.account")}" onclick="location.href = window.location.protocol + '//' + window.location.host + '/userRole/showMe'"/>
                                <div class="btn-group" role="group">
                                    <button id="adminDrop" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                    <div class="dropdown-menu custom-dropdown-right bg-primary" aria-labelledby="adminDrop" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0; left: 0; transform: translate3d(0px, 36px, 0px);">
                                        <a class="dropdown-item custom-dropdown-links" href="${createLink(controller: 'news', action: 'create')}"><g:message code="header.user.add.news"/></a>
                                        <a class="dropdown-item custom-dropdown-links" href="${createLink(controller: 'schedule', action: 'create')}"><g:message code="header.user.add.schedule"/></a>
                                        <a class="dropdown-item custom-dropdown-links" href="${createLink(controller: 'faq', action: 'create')}"><g:message code="header.user.add.faq"/></a>
                                        <a class="dropdown-item custom-dropdown-links" href="${createLink(controller: 'userRole', action: 'index')}"><g:message code="header.user.managing"/></a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item custom-dropdown-links" href="/logout"><g:message code="auth.logout"/></a>
                                    </div>
                                </div>
                            </div>
                        </sec:ifAllGranted>
                        <sec:ifAllGranted roles="ROLE_USER">
                            <div class="btn-group ml-5">
                                <input type="button" class="btn btn-primary" value="${message(code: "header.auth.account")}" onclick="location.href = window.location.protocol + '//' + window.location.host + '/userRole/showMe'"/>
                                <div class="btn-group" role="group">
                                    <button id="userDrop" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                    <div class="dropdown-menu custom-dropdown-right bg-primary" aria-labelledby="userDrop" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0; left: 0px; transform: translate3d(0px, 36px, 0px);">
                                        <a class="dropdown-item custom-dropdown-links" href="${createLink(controller: 'news', action: 'create')}"><g:message code="header.user.add.news"/></a>
                                        <a class="dropdown-item custom-dropdown-links" href="${createLink(controller: 'schedule', action: 'create')}"><g:message code="header.user.add.schedule"/></a>
                                        <a class="dropdown-item custom-dropdown-links" href="${createLink(controller: 'faq', action: 'create')}"><g:message code="header.user.add.faq"/></a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item custom-dropdown-links" href="/logout"><g:message code="auth.logout"/></a>
                                    </div>
                                </div>
                            </div>
                        </sec:ifAllGranted>
                    </sec:ifLoggedIn>
                </ul>
            </div>
        </nav>
        <div class="container-fluid container-bg">
            <g:layoutBody/>
        </div>
        <div class="footer custom-footer bg-primary" role="contentinfo">
            <div class="row">
                %{--contacts--}%
                <div class="col-5">
                    <div class="row">
                        <div class="col-4">
                            <a class="custom-footer-link" href="http://udhtu.edu.ua/ftk/knti"><g:message code="footer.goto.faculty"/></a>
                        </div>
                        <div class="col-4">
                            +38 (0562) 47-35-05
                        </div>
                        <div class="col-4">
                            kni@udhtu.edu.ua
                        </div>
                    </div>
                    <div class="row pt-3">
                        <div class="col-4">
                            <a class="custom-footer-link" href="http://udhtu.edu.ua/ftk/knti/kafsks"><g:message code="footer.goto.cathedra"/></a>
                        </div>
                        <div class="col-4">
                            +38 (056) 753-57-26
                        </div>
                        <div class="col-4">
                            comp_sys@udhtu.edu.ua
                        </div>
                    </div>
                </div>
                <div class="offset-2"></div>
                <div class="col-5">
                    <div class="row">
                        <div class="offset-6"></div>
                        <div class="col-6 pl-5">
                            <a class="custom-footer-link" href="http://udhtu.edu.ua/"><g:message code="footer.goto.mainsite"/></a>
                        </div>
                    </div>
                    <div class="row pt-3">
                        <div class="offset-6"></div>
                        <div class="col-6 pl-5">
                            ©2008-<g:currentYear/> Кафедра СКС
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt"/></div>
    </body>
</html>
