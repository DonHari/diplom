import diplom.Faq
import diplom.News
import diplom.Photo
import diplom.User
import diplom.faq.FaqType

class BootStrap {

    def init = { servletContext ->
        if (News.getAll().size() == 0) {
            Photo first = createPhoto('/bootstrap-images/1.jpg')
            Photo second = createPhoto('/bootstrap-images/2.jpg')
            Photo third = createPhoto('/bootstrap-images/3.jpg')
            Photo fourth = createPhoto('/bootstrap-images/4.jpg')
            Photo fifth = createPhoto('/bootstrap-images/5.jpg')
            User author = User.get(1)
            for (int i = 0; i < 1000; i++) {
                new News(
                        name: 'День відкритих дверей!',
                        photo: first,
                        description: "Дізнайся що саме тебе чекає та коли він буде.",
                        content: "День відкритих дверей буде **45 червня**!\r\nМи чекаємо на Вас!",
                        assignedPhotos: [first, second, third, fourth, fifth],
                        author: author
                ).save()
            }
            boolean flag = true
            for (int i = 0; i < 20; i++) {
                new Faq(
                        question: "Чи можу я щось зробити?",
                        answer: "Так, звісно Ви можете!",
                        faqType: flag ? FaqType.STUDENTS : FaqType.ENTRANTS,
                        author: author
                ).save()
                flag = !flag
            }
        }
    }
    def destroy = {
    }

    private Photo createPhoto(String path) {
        File file = new File(getClass().getResource(path).toURI())
        new Photo(file: file.bytes, fileName: file.name).save()
    }
}
