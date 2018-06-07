package diplom

import grails.transaction.Transactional
import grails.util.Holders
import org.grails.plugins.web.taglib.ApplicationTagLib

@Transactional
class ImageServiceImplService implements ImageService {

    List<Photo> saveAll(Map<String, Byte[]> byteList) {
        List<Photo> result = new LinkedList<>()
        Set<String> keys = byteList.keySet()
        for (String key : keys) {
            result.add(new Photo(file: byteList.get(key), fileName: key).save())
        }
        result
    }

    @Override
    Photo save(byte[] bytes, String fileName) {
        new Photo(file: bytes, fileName: fileName).save()
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
