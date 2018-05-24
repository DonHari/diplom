package diplom

interface UserService {
    List<User> list(Integer page, Integer max)

    User save(User user)

    User update(User user)

    void delete(User user)

    Integer count()

    User get(Long id)

    User updatePassword(Long userId, String password)

    User updateUsername(Long userId, String newUsername)

    Boolean checkPassword(Long userId, String password)

    Boolean checkIfUsernameAvailable(String username)
}