package diplom

import grails.plugin.springsecurity.annotation.Secured

class UserRoleController {

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def index() {
        respond(UserRole.getAll())
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def show(UserRole userRole) {
        respond(userRole)
    }
}
