package spring

import diplom.*
import diplom.i18n.CustomLocaleResolver
import org.springframework.security.authentication.encoding.PlaintextPasswordEncoder

beans = {
    faqService(FaqServiceImplService) {
        ref('faqService')
        securityService = ref('securityService')
    }
    newsService(NewsServiceImplService) {
        ref('newsService')
        securityService = ref('securityService')
        imageService = ref('imageService')
    }
    roleService(RoleServiceImplService) {
        ref('roleService')
    }
    scheduleService(ScheduleServiceImplService) {
        ref('scheduleService')
    }
    userService(UserServiceImplService) {
        ref('userService')
    }
    securityService(SecurityServiceImplService) {
        ref('securityService')
        springSecurityService = ref('springSecurityService')
    }
    userRoleService(UserRoleServiceImplService) {
        ref('userRoleService')
    }
    uploadScheduleFileService(UploadScheduleFileServiceImplService) {
        ref('uploadScheduleFileService')
        scheduleService = ref('scheduleService')
    }
    imageService(ImageServiceImplService){
        ref('imageService')
    }
    localeResolver(CustomLocaleResolver)
    //disables password encoder
    passwordEncoder(PlaintextPasswordEncoder)
}
