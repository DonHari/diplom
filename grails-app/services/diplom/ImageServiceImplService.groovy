package diplom

import grails.transaction.Transactional
import grails.util.Holders
import org.grails.plugins.web.taglib.ApplicationTagLib

@Transactional
class ImageServiceImplService implements ImageService {

    @Override
    byte[] getImage(Long id) {
        Photo.get(id).file
    }

    //todo doesn't work
    @Override
    byte[] getResourceImage(String path, String name) {
//        def assetMethodTagLib = Holders.getGrailsApplication().mainContext.getBean('asset.pipeline.grails.AssetMethodTagLib')
//        String pathToImage = assetMethodTagLib.assetPath(src: '/static/students/studcity_director.jpg')
        ApplicationTagLib g = Holders.getGrailsApplication().mainContext.getBean('asset.pipeline.grails.AssetMethodTagLib') as ApplicationTagLib
        String pathToImage = g.resource(contextPath: "", dir: path, file: name, absolute: true)
        new File(pathToImage).bytes
    }
}
