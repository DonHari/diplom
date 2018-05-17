package diplom

import grails.plugin.springsecurity.annotation.Secured

class UserRoleController {

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def index() {
        respond(UserRole.getAll())
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def show() {
        def userRole = UserRole.findByUserAndRole(User.get(params.userId), Role.get(params.roleId))
        respond(userRole)
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def save(User user, Role role) {

    }
}
