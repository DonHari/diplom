package diplom

import grails.plugin.springsecurity.annotation.Secured

class UserRoleController {

    UserRoleService userRoleService
    UserService userService
    SecurityService securityService
    RoleService roleService

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def index() {
        respond(UserRole.getAll())
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def show() {
        def userRole = userRoleService.get(params.userId as Long, params.roleId as Long)
        respond(userRole, model: [availableRoles: roleService.getAll(), justSaved: chainModel?.justSaved])
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
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
            it.enabled = params.enabled ?: it.enabled
            it.accountLocked = params.accountLocked ?: it.accountLocked
            it.accountExpired = params.accountExpired ?: it.accountExpired
            it.passwordExpired = params.passwordExpired ?: it.passwordExpired
        }
        userService.update(user)
        UserRole result = userRoleService.save(user, userRole.role)
        chain(action: 'show', model: [justSaved: true], params: [userId: result.userId, roleId: result.roleId])
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def updateMyself() {
        UserRole current = securityService.getAuthorizedUserAndRole()
        User user = userService.get(current.userId)
        user.with {
            it.username = current.user.username
            it.password = current.user.password
            it.surname = params.surname
            it.name = params.name
            it.secondName = params.secondName
            it.email = params.email
            it.enabled = params.enabled ?: it.enabled
            it.accountLocked = params.accountLocked ?: it.accountLocked
            it.accountExpired = params.accountExpired ?: it.accountExpired
            it.passwordExpired = params.passwordExpired ?: it.passwordExpired
        }
        userService.update(user)
        userRoleService.delete(current.user, current.role)
        UserRole result = userRoleService.save(user, roleService.get(params.newRoleId as Long))
        chain(action: 'showMe', model: [justSaved: true], params: [userId: result.userId, roleId: result.roleId])
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def showMe() {
        respond(securityService.getAuthorizedUserAndRole(), model: [availableRoles: roleService.getAll(), justSaved: chainModel?.justSaved])
    }
}
