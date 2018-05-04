package diplom

interface ImageService {

    List<Photo> saveAll(List<Byte[]> byteList)

    Photo save(byte[] bytes)

    byte[] getImage(Long id)

    byte[] getResourceImage(String path, String name)
}