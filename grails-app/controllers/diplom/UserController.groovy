package diplom

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class UserController {

    UserService userService

    def updatePassword(String username, String newPassword) {
        userService.updatePassword(username, newPassword)
        redirect(controller: 'news', action: 'index')
    }

    @Secured('permitAll')
    def checkUsername(String username) {
        render(contentType: 'application/json') {
            result(available: userService.checkIfUsernameAvailable(username))
        }
    }
}
