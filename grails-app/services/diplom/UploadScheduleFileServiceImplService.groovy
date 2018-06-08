package diplom

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional
class UploadScheduleFileServiceImplService implements UploadScheduleFileService {

    ScheduleService scheduleService

    private getSchedulePath = { ->
        new File(".").getCanonicalPath() + System.getProperty('file.separator') + "schedule"
    }

    private createDir = { String path ->
        File file = new File(path)
        if (!file.exists()) {
            file.mkdirs()
        }
    }

    private checkIfFileNotExists = { String path, String fileName ->
        String filePath = path + System.getProperty('file.separator') + fileName
        File file = new File(filePath)
        if (file.exists()) {
            file.delete()
        }
    }

    private checkIfFileExists = { String path, String fileName ->
        String filePath = path + System.getProperty('file.separator') + fileName
        File file = new File(filePath)
        if (!file.exists()) {
            log.error("File doesn't exist")
        }
    }

    private getRealFileName = { MultipartFile multipartFile ->
        multipartFile.originalFilename.substring(multipartFile.originalFilename.lastIndexOf('\\') + 1)
    }

    private saveFile = { String path, MultipartFile multipartFile, String fileName ->
        String filePath = path + System.getProperty('file.separator') + fileName
        File file = new File(filePath)
        if (file.createNewFile()) {
            FileOutputStream fos = new FileOutputStream(file)
            fos.write(multipartFile.getBytes())
            fos.close()
        } else {
            log.error("Can't create file")
            //todo throw exception
        }
    }

    private loadFile = { String path, String fileName ->
        String filePath = path + System.getProperty('file.separator') + fileName
        new File(filePath)
    }

    @Override
    String uploadFile(MultipartFile multipartFile, String name) {
        String schedulePath = getSchedulePath()
        createDir(schedulePath)
        checkIfFileNotExists(schedulePath, name)
        saveFile(schedulePath, multipartFile, name)
        getRealFileName(multipartFile)
    }

    @Override
    File loadFile(String fileName) {
        String schedulePath = getSchedulePath()
        checkIfFileExists(schedulePath, fileName)
        loadFile(schedulePath, fileName)
    }

    @Override
    Boolean checkIfFileExists(String fileName) {
        String filePath = getSchedulePath() + System.getProperty('file.separator') + fileName
        File file = new File(filePath)
        if (file.exists()) {
            return true
        }
    }
}
