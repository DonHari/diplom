package diplom

import diplom.commands.NewsCommand
import diplom.commands.NewsUpdateCommand
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
        Photo photo = imageService.save(command.photo.bytes, command.photo.originalFilename)
        List<Photo> assignedPhotos = imageService.saveAll(command.assignedPhotos.collectEntries { [it.originalFilename, it.bytes] })
        News news = new News(name: command.name, description: command.description, content: command.content, photo: photo, assignedPhotos: assignedPhotos)
        news.author = securityService.getAuthorizedUser()
        news.save()
    }

    @Override
    News update(NewsUpdateCommand newsUpdateCommand) {
        checkIfExists(newsUpdateCommand.newsId)
        News news = News.get(newsUpdateCommand.newsId)
        checkIfAuthor(news)
        List<String> newPhotoNames = newsUpdateCommand.collectPhotoNames()
        newPhotoNames.removeAll { it == null }
        List<Byte[]> newPhotoContent = newsUpdateCommand.collectPhotoContent()
        newPhotoContent.removeAll { it == null }
        news.with {
            news.name = newsUpdateCommand.name
            news.description = newsUpdateCommand.description
            news.content = newsUpdateCommand.content
            if (newsUpdateCommand.photoName != news.photo.fileName) {
//                news.photo.delete()
                news.photo = imageService.save(newsUpdateCommand.photo.bytes, newsUpdateCommand.photoName)
            }
            for (int i = 0; i < newPhotoNames.size(); i++) {
                if(newPhotoNames[i] != news.assignedPhotos[i]) {
                    if (news.assignedPhotos[i]) {
                        Photo old = news.assignedPhotos[i]
//                        news.assignedPhotos.remove(old)
                        old.delete()
                    }
                    news.assignedPhotos.add(imageService.save(newPhotoContent[i] as byte[], newPhotoNames[i]))
                }
            }
            news
        }
        news.save(flush: true)
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
