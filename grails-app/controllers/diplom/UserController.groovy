package diplom

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class UserController {

    UserService userService

    @Secured(["ROLE_ADMIN", 'IS_AUTHENTICATED_REMEMBERED'])
    def index(Integer page, Integer max) {
        List<User> users = userService.list(page, max)
        Integer userCount = userService.count()
        respond(users, model: [userCount: userCount])
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def show(User user) {
        respond(user)
    }

    @Secured(["ROLE_ADMIN", 'IS_AUTHENTICATED_REMEMBERED'])
    def create() {
        respond(new User(params))
    }

    @Secured(["ROLE_ADMIN", 'IS_AUTHENTICATED_REMEMBERED'])
    def save(User user) {
        User savedUser = userService.save(user)

        respond(savedUser, status: CREATED, view: "/user/show")
    }

    @Secured(["ROLE_ADMIN", 'IS_AUTHENTICATED_REMEMBERED'])
    def edit(User user) {
        respond(user)
    }

    @Secured(["ROLE_ADMIN", 'IS_AUTHENTICATED_REMEMBERED'])
    def update(User user) {
        User updatedUser = userService.update(user)

        respond(updatedUser, status: OK, view: "/user/show")
    }

    @Secured(["ROLE_ADMIN", 'IS_AUTHENTICATED_REMEMBERED'])
    def delete(User user) {
        userService.delete(user)

        redirect(controller: "user", action: "index", method: "GET", status: NO_CONTENT)
    }

    def updatePassword(String username, String newPassword) {
        userService.updatePassword(username, newPassword)
        redirect(controller: 'news', action: 'index')
    }
}
