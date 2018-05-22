package diplom

import grails.transaction.Transactional

@Transactional
class UserRoleServiceImplService implements UserRoleService {

    RoleService roleService
    UserService userService

    @Override
    UserRole save(User user, Role role) {
        UserRole.create(user, role, true)
    }

    @Override
    void delete(Long userId, Long roleId) {
        User user = userService.get(userId)
        Role role = roleService.get(roleId)
        this.delete(user, role)
    }

    @Override
    void delete(User user, Role role) {
        UserRole instance = UserRole.findByUserAndRole(user, role)
        instance.delete(flush: true)
    }

    @Override
    void deleteAll(User user) {
        List<UserRole> instances = UserRole.findAllByUser(user)
        instances.each { it.delete() }
    }

    @Override
    void deleteAll(Role role) {
        List<UserRole> instances = UserRole.findAllByRole(role)
        instances.each { it.delete() }
    }

    @Override
    UserRole findByUser(User user) {
        UserRole.findByUser(user)
    }

    @Override
    UserRole get(Long userId, Long roleId) {
        UserRole.get(userId, roleId)
    }
}
