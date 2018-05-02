package diplom

interface ImageService {

    byte[] getImage(Long id)

    byte[] getResourceImage(String path, String name)
}