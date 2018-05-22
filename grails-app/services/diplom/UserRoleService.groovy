package diplom

interface UserRoleService {

    UserRole save(User user, Role role)

    void delete(Long userId, Long roleId)

    void delete(User user, Role role)

    /**
     * Deletes all records for given user
     * @param user
     * @return
     */
    void deleteAll(User user)

    /**
     * Deletes all records for given role
     * @param role
     * @return
     */
    void deleteAll(Role role)

    UserRole findByUser(User user)

    UserRole get(Long userId, Long roleId)
}
