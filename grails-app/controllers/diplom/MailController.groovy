package diplom

import grails.plugin.springsecurity.annotation.Secured

class MailController {

    MailService customMailService
    RoleService roleService

    @Secured('ROLE_ADMIN')
    def inviteUser() {
        Role role = roleService.findByAuthority(params.authority)
        customMailService.sendUserInviteEmail(params.userEmail, role)
        chain(controller: 'userRole', action: 'index', model: [justInvited: true])
    }
}
