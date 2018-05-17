package diplom

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.web.WebAttributes

class LoginController extends grails.plugin.springsecurity.LoginController {

    private String errorMessage

    def auth() {
        ConfigObject configObject = getConf()
        if (springSecurityService.isLoggedIn()) {
            redirect(view: '/')
            return
        }

        String postUrl = request.contextPath + configObject.apf.filterProcessesUrl
        String localErrorMessage = errorMessage
        errorMessage = null
        render(view: 'auth', model: [
                postUrl            : postUrl,
                rememberMeParameter: configObject.rememberMe.parameter,
                usernameParameter  : configObject.apf.usernameParameter,
                passwordParameter  : configObject.apf.passwordParameter,
                gspLayout          : conf.gsp.layoutAuth,
                errorMessage       : localErrorMessage
        ])
    }

    @Secured('permitAll')
    def check(String username, String password) {
        boolean found = true
        if (User.findByUsernameAndPassword(username, password) == null) {
            found = false
        }
        render(contentType: 'application/json') {
            result(status: found)
        }
    }

    def authfail() {
        String msg = ''
        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
        if (exception) {
            if (exception instanceof AccountExpiredException) {
                msg = messageSource.getMessage('springSecurity.errors.login.expired', null, "Account Expired", request.locale)
            } else if (exception instanceof CredentialsExpiredException) {
                msg = messageSource.getMessage('springSecurity.errors.login.passwordExpired', null, "Password Expired", request.locale)
            } else if (exception instanceof DisabledException) {
                msg = messageSource.getMessage('springSecurity.errors.login.disabled', null, "Account Disabled", request.locale)
            } else if (exception instanceof LockedException) {
                msg = messageSource.getMessage('springSecurity.errors.login.locked', null, "Account Locked", request.locale)
            } else {
                msg = messageSource.getMessage('springSecurity.errors.login.fail', null, "Authentication Failure", request.locale)
            }
        }
        errorMessage = msg
        redirect(action: 'auth', params: params)
    }

    def denied() {
        render(view: 'deneid')
    }
}
