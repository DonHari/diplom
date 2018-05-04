<!doctype html>
<html lang="ru" class="no-js">
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
                %{--Navbar--}%
                <img class="custom-logo" src="${assetPath(src:'/site_logo.png')}">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor01">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item" id="newsHeader" onclick="setNewsHeaderActive()">
                        <a class="nav-link" onclick="setNewsHeaderActive()" href="/" ><g:message code="header.news" default="News"/></a>
                    </li>
                    <li class="nav-item" id="enrolleeHeader">
                        <a class="nav-link" onclick="setEnrolleeHeaderActive()" href="#"><g:message code="header.enrollee" default="For enrollee"/></a>
                    </li>
                    <li class="nav-item" id="studentsHeader">
                        <a class="nav-link" onclick="setStudentsHeaderActive()" href="/students"><g:message code="header.student" default="For students"/></a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item" id="langEN">
                        <a class="nav-link" href="?lang=en" onclick="langEnClicked()"><g:message code="language.en" default="EN"/></a>
                    </li>
                    <li class="nav-item" id="langRU">
                        <a class="nav-link" href="?lang=ru" onclick="langRuClicked()"><g:message code="language.ru" default="RU"/></a>
                    </li>
                    <li class="nav-item" id="langUA">
                        <a class="nav-link" href="?lang=ua" onclick="langUaClicked()"><g:message code="language.ua" default="UA"/></a>
                    </li>
                    <sec:ifNotLoggedIn>
                        <li class="nav-item ml-5" id="authorize">
                            <a class="nav-link" href="${createLink(controller: 'login', action: 'auth')}"><g:message code="header.autorization.signin" default="Sign-in"/></a>
                        </li>
                    </sec:ifNotLoggedIn>
                    <sec:ifLoggedIn>
                        <div class="btn-group ml-5">
                            <button type="button" class="btn btn-primary">Учетная запись</button>
                            <div class="btn-group" role="group">
                                <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                <div class="dropdown-menu custom-dropdown-right bg-primary" aria-labelledby="btnGroupDrop1" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 36px, 0px);">
                                    <a class="dropdown-item custom-dropdown-links" href="#">Dropdown link</a>
                                    <a class="dropdown-item custom-dropdown-links" href="#">Dropdown link</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item custom-dropdown-links" href="/logout"><g:message code="auth.logout" default="Log out"/></a>
                                </div>
                            </div>
                        </div>
                    </sec:ifLoggedIn>
                </ul>
            </div>
        </nav>
        <div class="container-fluid container-bg">
            <g:layoutBody/>
        </div>
        <div class="footer custom-footer bg-primary" role="contentinfo">
            <div class="row">
                %{--phone numbers--}%
                <div class="col-4">
                    <div class="row">
                        <div class="col-4">
                            <a class="custom-footer-link" href="http://udhtu.edu.ua/ftk/knti">Факультет КНтаІ</a>
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
                            <a class="custom-footer-link" href="http://udhtu.edu.ua/ftk/knti/kafsks">Кафедра СКС</a>
                        </div>
                        <div class="col-4">
                            +38 (056) 753-57-26
                        </div>
                        <div class="col-4">
                            comp_sys@udhtu.edu.ua
                        </div>
                    </div>
                </div>
                <div class="offset-4"></div>
                %{--link to site--}%
                <div class="col-4">
                    <div class="row">
                        <div class="offset-6"></div>
                        <div class="col-6">
                            <a class="custom-footer-link" href="http://udhtu.edu.ua/">Перейти на сайт УДХТУ</a>
                        </div>
                    </div>
                    <div class="row pt-3">
                        <div class="offset-6"></div>
                        <div class="col-6">
                            ©2008-2018 Кафедра СКС
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
    </body>
</html>
