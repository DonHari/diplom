package diplom

import diplom.commands.NewsCommand
import diplom.commands.NewsUpdateCommand
import grails.transaction.Transactional

@Transactional
class NewsServiceImplService implements NewsService {

    ImageService imageService

    SecurityService securityService

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
        News news = News.get(newsUpdateCommand.newsId)
        List<String> newPhotoNames = newsUpdateCommand.collectPhotoNames()
        newPhotoNames.removeAll { it == null }
        List<Byte[]> newPhotoContent = newsUpdateCommand.collectPhotoContent()
        newPhotoContent.removeAll { it == null }
        news.with {
            it.name = newsUpdateCommand.name
            it.description = newsUpdateCommand.description
            it.content = newsUpdateCommand.content
            if (newsUpdateCommand.photoName != it.photo.fileName) {
                it.photo = imageService.save(newsUpdateCommand.photo.bytes, newsUpdateCommand.photoName)
            }
            if (!news.assignedPhotos.fileName.containsAll(newPhotoNames) || !newPhotoNames.containsAll(news.assignedPhotos.fileName)) {
                for (int i = 0; i < newPhotoNames.size(); i++) {
                    if (it.assignedPhotos[i] && !newPhotoNames.contains(it.assignedPhotos[i])) {
                        it.assignedPhotos.add(imageService.save(newPhotoContent[i] as byte[], newPhotoNames[i]))
                    }
                }
            }
            it
        }
        news.save(flush: true)
    }

    @Override
    Integer count() {
        News.count
    }
}
