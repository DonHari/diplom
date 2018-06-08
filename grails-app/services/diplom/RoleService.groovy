package diplom

interface RoleService {
    List<Role> getAll()

    Role get(Long id)

    Role findByAuthority(String authority)
}