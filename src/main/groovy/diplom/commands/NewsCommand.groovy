package diplom.commands

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

class NewsCommand implements Validateable {
    private static final List<String> availableExtensions = ['.jpg', '.png', '.jpeg']

    String name
    String description
    String content
    MultipartFile photo
    List<MultipartFile> assignedPhotos

    static constraints = {
        name nullable: false
        description nullable: false
        content nullable: false
        photo validator: { val, obj ->
            if (val == null) {
                return false
            }

            if (val.empty) {
                return false
            }

            availableExtensions.any({ extension ->
                val.originalFilename?.toLowerCase()?.endsWith(extension)
            })
        }
        assignedPhotos validator: { val, obj ->
            true

        }
    }
}
