import diplom.News
import diplom.Photo
import diplom.User

class BootStrap {

    def init = { servletContext ->
        if (News.getAll().size() == 0) {
            Photo first = createPhoto('/bootstrap-images/1.jpg')
            Photo second = createPhoto('/bootstrap-images/2.jpg')
            Photo third = createPhoto('/bootstrap-images/3.jpg')
            Photo fourth = createPhoto('/bootstrap-images/4.jpg')
            Photo fifth = createPhoto('/bootstrap-images/5.jpg')
            User author = User.get(1)
            new News(
                    name: 'День відкритих дверей!',
                    photo: first,
                    description: "Дізнайся що саме тебе чекає та коли він буде.",
                    content: "День відкритих дверей буде **45 червня**!\r\nМи чекаємо на Вас!",
                    assignedPhotos: [first, second, third, fourth, fifth],
                    author: author
            ).save()
            new News(
                    name: 'День відкритих дверей!',
                    photo: first,
                    description: "Дізнайся що саме тебе чекає та коли він буде.",
                    content: "День відкритих дверей буде **45 червня**!\r\nМи чекаємо на Вас!",
                    assignedPhotos: [first, second, third, fourth, fifth],
                    author: author
            ).save()
            new News(
                    name: 'День відкритих дверей!',
                    photo: first,
                    description: "Дізнайся що саме тебе чекає та коли він буде.",
                    content: "День відкритих дверей буде **45 червня**!\r\nМи чекаємо на Вас!",
                    assignedPhotos: [first, second, third, fourth, fifth],
                    author: author
            ).save()
        }
    }
    def destroy = {
    }

    private Photo createPhoto(String path) {
        File file = new File(getClass().getResource(path).toURI())
        new Photo(file: file.bytes, fileName: file.name).save()
    }
}
