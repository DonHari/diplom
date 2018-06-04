<!doctype html>
<html>
    <head>
        %{--<title><g:message code="auth.title"/></title>--}%
        %{--<meta name="layout" content="main">--}%
    </head>
    <body>
        <div class="row">
            %{--<div class="offset-4"></div>--}%
            <div class="col-12 content-auth" id="loginContent">
                <g:if test="${errorMessage}">
                    <div class="alert alert-dismissible alert-danger">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        ${errorMessage}
                    </div>
                </g:if>
                <g:else>
                    <div id="loginError"></div>
                </g:else>
                <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm">
                    <div class="form-group">
                        <label class="control-label" for="username"><g:message code="auth.username"/></label>
                        <input class="form-control" id="username" type="text" name="${usernameParameter ?: 'username'}">
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="password"><g:message code='auth.password'/>:</label>
                        <input class="form-control" type="password" name="${passwordParameter ?: 'password'}" id="password"/>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck2" name="${rememberMeParameter ?: 'remember-me'}" <g:if test="${hasCookie}">checked="checked"</g:if>>
                        <label class="custom-control-label" for="customCheck2"><g:message code="auth.remember"/></label>
                    </div>
                    <input class="btn btn-outline-primary mt-2" type="submit" id="authSubmit" value="${message(code:'auth.button.login')}"/>
                </form>
            </div>
            %{--<div class="offset-4"></div>--}%
        </div>
        <script>
            (function() {
                document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
            })();
        </script>
    </body>
</html>
