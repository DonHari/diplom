package diplom

import diplom.commands.NewsCommand
import diplom.commands.NewsUpdateCommand

interface NewsService {
    List<News> list(Integer offset, Integer max)

    News save(NewsCommand command)

    News update(NewsUpdateCommand newsUpdateCommand)

    Integer count()
}