package diplom

import grails.transaction.Transactional

@Transactional
class MailServiceImplService implements MailService {

    private final static String EMAIL_SUBJECT = "Запрошення до реєстрації в системі"

    @Override
    void sendUserInviteEmail(String userEmail, Role role) {
        sendMail({
            to(userEmail)
            subject(EMAIL_SUBJECT)
            html(view: '/email/inviteEmail', model: [userEmail: userEmail, userRole: role.authority])
        })
    }
}
