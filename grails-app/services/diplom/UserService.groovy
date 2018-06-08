package diplom

interface UserService {

    User save(User user)

    User update(User user)

    User get(Long id)

    User updatePassword(Long userId, String password)

    User updateUsername(Long userId, String newUsername)

    Boolean checkPassword(Long userId, String password)

    Boolean checkIfUsernameAvailable(String username)
}