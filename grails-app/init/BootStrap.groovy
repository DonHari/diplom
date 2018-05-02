import diplom.News
import diplom.Photo
import diplom.User
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (Environment.current.name == 'development') {
            File file = new File('images\\news\\img1.png')
            Photo photo = new Photo(file: file.getBytes()).save(flush: true)
            User user = new User(name: "test", secondName: "test", surname: "test", username: "test", password: "test", email: "test@test.com").save(flush: true)
            for (int i = 0; i < 100; i++) {
                String desc = ''
                Random random = new Random(System.nanoTime());
                for (int o = 0; o < random.nextInt(150) + 50; o++) {
                    desc += 't'
                }
                new News(photo: photo, author: user, name: "Test name ${i}", description: desc, content: "Test content ${i}").save(flush: true)
            }
        }
    }
    def destroy = {
    }
}
