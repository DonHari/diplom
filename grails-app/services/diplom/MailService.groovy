package diplom

interface MailService {

    /**
     * Метод отправляет сообщение на почту с предложением зарегистрироваться в системе
     * @param userEmail почта юзера
     */
    void sendUserInviteEmail(String userEmail, Role role)
}