package diplom

import grails.plugin.springsecurity.annotation.Secured

class UserRoleController {

    UserRoleService userRoleService
    UserService userService
    SecurityService securityService
    RoleService roleService

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def index() {
        respond(UserRole.getAll(), model: [justInvited: chainModel?.justInvited, roleList: roleService.getAll()])
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
        respond(securityService.getAuthorizedUserAndRole(), model: [availableRoles: roleService.getAll(), justSaved: chainModel?.justSaved, errorOccurred: chainModel?.errorOccurred, activeTab: chainModel?.activeTab, errorMessage: chainModel?.errorMessage])
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def updateLogin() {
        if (userService.checkPassword(params.userId as Long, params.password as String)) {
            if (userService.checkIfUsernameAvailable(params.newUsername)) {
                userService.updateUsername(params.userId as Long, params.newUsername as String)
                chain(action: 'showMe', model: [justSaved: true])
            } else {
                chain(action: 'showMe', model: [errorOccurred: true, activeTab: 'updateLogin', errorMessage: "Введене ім'я користувача вже зайнято!"])
            }
        } else {
            chain(action: 'showMe', model: [errorOccurred: true, activeTab: 'updateLogin', errorMessage: 'Неправильно введенний пароль!'])
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def updatePassword() {
        if (userService.checkPassword(params.userId as Long, params.password as String)) {
            userService.updatePassword(params.userId as Long, params.newPassword as String)
            chain(action: 'showMe', model: [justSaved: true])
        } else {
            chain(action: 'showMe', model: [errorOccurred: true, activeTab: 'updatePassword', errorMessage: 'Неправильно введенний пароль!'])
        }
    }

    @Secured('permitAll')
    def invite() {
        User user = new User(email: params.email)
        Role role = roleService.findByAuthority(params.authority)
        UserRole userRole = new UserRole(user: user, role: role)
        response.characterEncoding = 'utf-8'
        respond(userRole, formats: ['html'])
    }

    @Secured('permitAll')
    def register() {
        User user = new User()
        Role role = roleService.findByAuthority(params.authority)
        user.with {
            user.name = params.name
            user.secondName = params.secondName
            user.surname = params.surname
            user.username = params.username
            user.password = params.password
            user.email = params.email
        }
        userService.save(user)
        userRoleService.save(user, role)
        chain(controller: 'news', action: 'index', model: [justRegistered: true], params: [offset: 0, max: 10])
    }
}
