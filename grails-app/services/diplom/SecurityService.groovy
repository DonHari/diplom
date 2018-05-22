package diplom

interface SecurityService {

    User getAuthorizedUser()

    UserRole getAuthorizedUserAndRole()

}