package diplom

import grails.transaction.Transactional

@Transactional
class SecurityServiceImplService implements SecurityService {

    def springSecurityService
    UserRoleService userRoleService

    @Override
    User getAuthorizedUser() {
        springSecurityService.currentUser as User
    }

    @Override
    UserRole getAuthorizedUserAndRole() {
        User user = getAuthorizedUser()
        userRoleService.findByUser(user)
    }
}
