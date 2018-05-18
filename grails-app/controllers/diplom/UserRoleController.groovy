package diplom

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

class UserRoleController {

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def index() {
        respond(UserRole.getAll())
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def show() {
        def userRole = UserRole.findByUserAndRole(User.get(params.userId), Role.get(params.roleId))
        respond(userRole, model: [availableRoles: Role.getAll(), justSaved: chainModel?.justSaved])
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    @Transactional
    def save(UserRole userRole, Long oldRoleId) {
        //todo doesn't work
//        UserRole.deleteAll()
        UserRole.remove(userRole.user, Role.get(oldRoleId))
        userRole.user.save()
        UserRole.create(userRole.user, userRole.role)
        chain(action: 'show', model: [justSaved: true])
    }
}
