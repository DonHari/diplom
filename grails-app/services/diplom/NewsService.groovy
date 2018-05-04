package diplom

import diplom.commands.NewsCommand

interface NewsService {
    List<News> list(Integer offset, Integer max)

    News save(NewsCommand command)

    News update(News news)

    void delete(News news)

    Integer count()
}