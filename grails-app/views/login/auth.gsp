<!doctype html>
<html>
    <head>
        <title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
        <meta name="layout" content="main">
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>
    <body>
        <div class="row">
            <div class="offset-4"></div>
            <div class="col-4 content pt-3 pb-3">
                <g:if test="${errorMessage}">
                    <div class="alert alert-dismissible alert-danger">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        ${errorMessage}
                    </div>
                </g:if>
                <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" >
                    <div class="form-group">
                        <label class="control-label" for="username"><g:message code="auth.username" default="Username"/></label>
                        <input class="form-control" id="username" type="text" name="${usernameParameter ?: 'username'}">
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="password"><g:message code='auth.password' default="Password"/>:</label>
                        <input class="form-control" type="password" name="${passwordParameter ?: 'password'}" id="password"/>
                    </div>
                    <div class="form-check pb-2">
                        <input type="checkbox" class="form-check-input" id="rememberMe" name="${rememberMeParameter ?: 'remember-me'}" <g:if test="${hasCookie}">checked="checked"</g:if>/>
                        <label for="rememberMe"><g:message code="auth.remember" default="Remember me"/></label>
                    </div>
                    <input class="btn btn-outline-primary" type="submit" id="submit" value="${message(code:'auth.button.login', default: 'Login')}"/>
                </form>
            </div>
            <div class="offset-4"></div>
        </div>
        <script>
            (function() {
                document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
            })();
        </script>
    </body>
</html>