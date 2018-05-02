package diplom

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import grails.util.Environment

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class NewsController {

    NewsService newsService

    @Secured('permitAll')
    def index(Integer offset, Integer max) {
        fillDb()
        List<News> newsList = newsService.list(offset, max)
        Long newsCount = newsService.count()
        respond(newsList, model: [newsCount: newsCount, maxPerPage: PageUtil.getMaxValue(max)])
    }

    private void fillDb() {
        if (Environment.current.name == 'development' && News.count == 0) {
            File file = new File('grails-app\\assets\\images\\news\\img1.png')
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

    @Secured('permitAll')
    def show(News news) {
        respond(news)
    }

    @Secured("ROLE_USER")
    def create() {
        respond(new News(params))
    }

    @Secured("ROLE_USER")
    @Transactional
    def save(News news) {
        News savedNews = newsService.save(news)

        respond(savedNews, status: CREATED, view: "/news/show")
    }

    @Secured("ROLE_USER")
    def edit(News news) {
        respond(news)
    }

    @Secured("ROLE_USER")
    @Transactional
    def update(News news) {
        News updatedNews = newsService.update(news)

        respond(updatedNews, status: OK, view: "/news/show")
    }

    @Secured("ROLE_USER")
    @Transactional
    def delete(News news) {
        newsService.delete(news)

        redirect(controller: "news", action: "index", method: "GET", status: NO_CONTENT)
    }
}
