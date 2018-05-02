package diplom

class ImageController {

    ImageService imageService

    def get(Long id) {
        byte[] bytes = imageService.getImage(id)
        response.outputStream << bytes
    }

    def getResourceImage(String path, String name) {
        byte[] bytes = imageService.getResourceImage(path, name)
        response.outputStream << bytes
    }
}
