package diplom.commands

import org.springframework.web.multipart.MultipartFile


class NewsUpdateCommand {
    Long newsId
    String name
    String description
    String content
    MultipartFile photo
    String photoName
    MultipartFile assignedPhoto0
    String assignedPhoto0Name
    MultipartFile assignedPhoto1
    String assignedPhoto1Name
    MultipartFile assignedPhoto2
    String assignedPhoto2Name
    MultipartFile assignedPhoto3
    String assignedPhoto3Name
    MultipartFile assignedPhoto4
    String assignedPhoto4Name
    MultipartFile assignedPhoto5
    String assignedPhoto5Name
    MultipartFile assignedPhoto6
    String assignedPhoto6Name
    MultipartFile assignedPhoto7
    String assignedPhoto7Name
    MultipartFile assignedPhoto8
    String assignedPhoto8Name
    MultipartFile assignedPhoto9
    String assignedPhoto9Name
    MultipartFile assignedPhoto10
    String assignedPhoto10Name
    MultipartFile assignedPhoto11
    String assignedPhoto11Name
    MultipartFile assignedPhoto12
    String assignedPhoto12Name

    def collectPhotoNames = { ->
        [assignedPhoto0Name, assignedPhoto1Name, assignedPhoto2Name, assignedPhoto3Name, assignedPhoto4Name, assignedPhoto5Name, assignedPhoto6Name,
         assignedPhoto7Name, assignedPhoto8Name, assignedPhoto9Name, assignedPhoto10Name, assignedPhoto11Name, assignedPhoto12Name]
    }

    def collectPhotoContent = { ->
        [assignedPhoto0?.bytes, assignedPhoto1?.bytes, assignedPhoto2?.bytes, assignedPhoto3?.bytes, assignedPhoto4?.bytes,
         assignedPhoto5?.bytes, assignedPhoto6?.bytes, assignedPhoto7?.bytes, assignedPhoto8?.bytes,
         assignedPhoto9?.bytes, assignedPhoto10?.bytes, assignedPhoto11?.bytes, assignedPhoto12?.bytes]
    }
}
