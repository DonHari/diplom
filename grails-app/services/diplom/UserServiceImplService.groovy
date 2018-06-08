package diplom

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional

@Transactional
class UserServiceImplService implements UserService {

    UserRoleService userRoleService
    SpringSecurityService springSecurityService

    private checkIfExists = { Long id ->
        if (!User.exists(id)) {
            throw new CantFindException("Can't find requested user!")
        }
    }

    @Override
    User save(User user) {
        user.save()
        //todo save userRoles too
    }

    @Override
    User update(User user) {
        checkIfExists(user.id)
        user.save()
    }

    @Override
    User get(Long id) {
        User.get(id)
    }

    User updatePassword(Long userId, String newPassword) {
        User user = User.get(userId)
        if (user) {
            user.password = newPassword
            user.save(flush: true)
        }
    }

    @Override
    User updateUsername(Long userId, String newUsername) {
        User user = User.get(userId)
        user.username = newUsername
        user.save(flush: true)
        user
    }

    @Override
    Boolean checkPassword(Long userId, String password) {
        Boolean result = false
        User user = User.get(userId)
        if (user.password == password) {
            result = true
        }
        result
    }

    @Override
    Boolean checkIfUsernameAvailable(String username) {
        User user = User.findByUsername(username)
        return !(user as boolean)
    }
}
