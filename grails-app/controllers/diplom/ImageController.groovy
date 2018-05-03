package diplom

import grails.plugin.springsecurity.annotation.Secured

class ImageController {

    ImageService imageService

    @Secured('permitAll')
    def get(Long id) {
        byte[] bytes = imageService.getImage(id)
        response.outputStream << bytes
    }

    @Secured('permitAll')
    def getResourceImage(String path, String name) {
        byte[] bytes = imageService.getResourceImage(path, name)
        response.outputStream << bytes
    }
}
