package diplom

import grails.transaction.Transactional
import grails.util.Environment

import javax.servlet.http.HttpServletRequest

@Transactional
class MailServiceImplService implements MailService {

    private final static String EMAIL_SUBJECT = "Запрошення до реєстрації в системі"

    private String builLink(HttpServletRequest request) {
        String result = "http://${request.serverName}"
        if (Environment.current.name != 'heroku') {
            result += ":${request.serverPort}"
        }
        result += '/userRole/invite'
        result
    }

    @Override
    void sendUserInviteEmail(String userEmail, Role role, HttpServletRequest request) {
        sendMail({
            to(userEmail)
            subject(EMAIL_SUBJECT)
            html(view: '/email/inviteEmail', model: [userEmail: userEmail, userRole: role.authority, link: builLink(request)])
        })
    }
}
