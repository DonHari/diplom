package diplom

interface ImageService {

    List<Photo> saveAll(Map<String, Byte[]> byteList)

    Photo save(byte[] bytes, String fileName)

    byte[] getImage(Long id)

    byte[] getResourceImage(String path, String name)
}