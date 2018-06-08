package diplom

import grails.transaction.Transactional

@Transactional
class RoleServiceImplService implements RoleService {

    @Override
    List<Role> getAll() {
        Role.getAll()
    }

    @Override
    Role get(Long id) {
        Role.get(id)
    }

    @Override
    Role findByAuthority(String authority) {
        Role.findByAuthority(authority)
    }
}
