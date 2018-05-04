package diplom

import grails.transaction.Transactional
import grails.util.Holders
import org.grails.plugins.web.taglib.ApplicationTagLib

@Transactional
class ImageServiceImplService implements ImageService {

    List<Photo> saveAll(List<Byte[]> byteList) {
        List<Photo> result = new LinkedList<>()
        for (Byte[] bytes : byteList) {
            result.add(new Photo(file: bytes).save())
        }
        result
    }

    @Override
    Photo save(byte[] bytes) {
        new Photo(file: bytes).save()
    }

    @Override
    byte[] getImage(Long id) {
        Photo.get(id).file
    }

    //todo doesn't work
    @Override
    byte[] getResourceImage(String path, String name) {
        ApplicationTagLib g = Holders.getGrailsApplication().mainContext.getBean('asset.pipeline.grails.AssetMethodTagLib') as ApplicationTagLib
        String pathToImage = g.resource(contextPath: "", dir: path, file: name, absolute: true)
        new File(pathToImage).bytes
    }
}
