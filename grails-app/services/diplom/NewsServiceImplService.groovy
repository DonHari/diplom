package diplom

import diplom.commands.NewsCommand
import grails.transaction.Transactional

@Transactional
class NewsServiceImplService implements NewsService {

    ImageService imageService

    SecurityService securityService

    private checkIfExists = { Long id ->
        if (!News.exists(id)) {
            throw new CantFindException("Can't find requested news!")
        }
    }

    private checkIfAuthor = { News news ->
        if (news.author.id != securityService.getAuthorizedUser().id) {
            throw new CantUpdateException("You can't delete or update this news")
        }
    }

    @Override
    List<News> list(Integer offset, Integer max) {
        Integer localOffset = offset ?: 0
        Integer localMax = PageUtil.getMaxValue(max)
        News.list(max: localMax, offset: localOffset, sort: 'dateCreated', order: 'desc')
    }

    @Override
    News save(NewsCommand command) {
        Photo photo = imageService.save(command.photo.bytes)
//        List<Photo> assignedPhotos = imageService.saveAll(command.assignedPhotos.collect { it.bytes } as List<Byte[]>)
        News news = new News(name: command.name, description: command.description, content: command.content, photo: photo/*, assignedPhotos: assignedPhotos*/)
        news.author = securityService.getAuthorizedUser()
        news.save()
    }

    @Override
    News update(News news) {
        checkIfExists(news.id)
        checkIfAuthor(news)
        news.save()
    }

    @Override
    void delete(News news) {
        checkIfExists(news.id)
        checkIfAuthor(news)
        news.delete()
    }

    @Override
    Integer count() {
        News.count
    }
}
