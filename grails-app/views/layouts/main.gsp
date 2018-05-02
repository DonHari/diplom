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
            <a class="navbar-brand" href="/">Navbar</a>
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
                        <li class="nav-item" id="authorize">
                            <a class="nav-link divider-left" href="/login"><g:message code="header.autorization.signin" default="Sign-in"/></a>
                        </li>
                    </sec:ifNotLoggedIn>
                    <sec:ifLoggedIn>
                        <li class="nav-item" id="userFullName">
                            <a class="nav-link divider-left" href="#"><g:message code="header.authorization.account" default="Account"/></a>
                        </li>
                    </sec:ifLoggedIn>
                </ul>
            </div>
        </nav>
        <div class="container-fluid container-bg">
            <g:layoutBody/>
        </div>
        <div class="footer" role="contentinfo"></div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
    </body>
</html>
