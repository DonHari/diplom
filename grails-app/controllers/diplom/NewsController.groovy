package diplom

import diplom.commands.NewsCommand
import diplom.commands.NewsUpdateCommand
import diplom.validator.Validate
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

import static org.springframework.http.HttpStatus.NO_CONTENT
import static org.springframework.http.HttpStatus.OK

@Transactional(readOnly = true)
class NewsController {

    NewsService newsService

    @Secured('permitAll')
    def index(Integer offset, Integer max) {
        List<News> newsList = newsService.list(offset, max)
        Long newsCount = newsService.count()
        respond(newsList, model: [newsCount: newsCount, maxPerPage: PageUtil.getMaxValue(max), justRegistered: chainModel?.justRegistered])
    }

    @Secured('permitAll')
    def show(News news) {
        respond(news)
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN", "IS_AUTHENTICATED_REMEMBERED"])
    def create() {
        respond(new News(name: 'test'))
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN", "IS_AUTHENTICATED_REMEMBERED"])
    @Transactional
    def save(NewsCommand newsCommand) {
        List<MultipartFile> assignedPhotos = new LinkedList<>()
        if (params.assignedPhoto1) {
            assignedPhotos.add(params.assignedPhoto1)
        }
        if (params.assignedPhoto2) {
            assignedPhotos.add(params.assignedPhoto2)
        }
        if (params.assignedPhoto3) {
            assignedPhotos.add(params.assignedPhoto3)
        }
        if (params.assignedPhoto4) {
            assignedPhotos.add(params.assignedPhoto4)
        }
        if (params.assignedPhoto5) {
            assignedPhotos.add(params.assignedPhoto5)
        }
        if (params.assignedPhoto6) {
            assignedPhotos.add(params.assignedPhoto6)
        }
        if (params.assignedPhoto7) {
            assignedPhotos.add(params.assignedPhoto7)
        }
        if (params.assignedPhoto8) {
            assignedPhotos.add(params.assignedPhoto8)
        }
        if (params.assignedPhoto9) {
            assignedPhotos.add(params.assignedPhoto9)
        }
        if (params.assignedPhoto10) {
            assignedPhotos.add(params.assignedPhoto10)
        }
        if (params.assignedPhoto11) {
            assignedPhotos.add(params.assignedPhoto11)
        }
        if (params.assignedPhoto12) {
            assignedPhotos.add(params.assignedPhoto12)
        }
        newsCommand.assignedPhotos = assignedPhotos
        Validate.hasNoErrors(newsCommand)

        News savedNews = newsService.save(newsCommand)

        chain(action: 'show', params: [id: savedNews.id])
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN", "IS_AUTHENTICATED_REMEMBERED"])
    def edit(News news) {
        respond(news)
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN", "IS_AUTHENTICATED_REMEMBERED"])
    @Transactional
    def update(NewsUpdateCommand newsUpdateCommand) {
        News updatedNews = newsService.update(newsUpdateCommand)

        chain(action: 'show', params: [id: updatedNews.id])
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN", "IS_AUTHENTICATED_REMEMBERED"])
    @Transactional
    def delete(News news) {
        newsService.delete(news)

        redirect(controller: "news", action: "index", method: "GET", status: NO_CONTENT)
    }
}
