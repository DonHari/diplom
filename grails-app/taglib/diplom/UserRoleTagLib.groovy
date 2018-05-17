package diplom

class UserRoleTagLib {
    static defaultEncodeAs = [taglib: 'html']

    /**
     * @attr authority REQUIRED
     */
    def resolveRoleAuthority = { attrs, body ->
        String result = "Не встановлена"
        if (attrs.authority == 'ROLE_ADMIN') {
            result = "Адміністратор"
        } else if (attrs.authority == 'ROLE_USER') {
            result = "Користувач"
        }
        out << result
    }
}
