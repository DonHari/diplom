package diplom

import org.springframework.web.multipart.MultipartFile

interface UploadScheduleFileService {
    /**
     * Uploads file to server
     * @param excelFileCommand
     * @return
     */
    String uploadFile(MultipartFile excelFileCommand, String name)

    /**
     * Loads file from server
     * @param schedule
     * @return
     */
    File loadFile(String fileName)

    Boolean checkIfFileExists(String fileName)
}