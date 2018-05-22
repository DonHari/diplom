package diplom

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

class UserRoleController {

    UserRoleService userRoleService
    UserService userService

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
        userRoleService.delete(userRole.userId, oldRoleId)
        User user = userService.get(userRole.userId)
        user.with {
            it.username = userRole.user.username
            it.password = userRole.user.password
            it.surname = params.surname
            it.name = params.name
            it.secondName = params.secondName
            it.email = params.email
            it.enabled = params.enabled ?: false
            it.accountLocked = params.accountLocked ?: false
            it.accountExpired = params.accountExpired ?: false
            it.passwordExpired = params.passwordExpired ?: false
        }
        userService.update(user)
        UserRole result = userRoleService.save(user, userRole.role)
        chain(action: 'show', model: [justSaved: true], params: [userId: result.userId, roleId: result.roleId])
    }
}
