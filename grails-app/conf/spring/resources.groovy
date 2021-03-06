package spring

import diplom.*
import org.springframework.security.authentication.encoding.PlaintextPasswordEncoder
import org.springframework.web.servlet.i18n.FixedLocaleResolver

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
        userRoleService = ref('userRoleService')
    }
    uploadScheduleFileService(UploadScheduleFileServiceImplService) {
        ref('uploadScheduleFileService')
        scheduleService = ref('scheduleService')
    }
    imageService(ImageServiceImplService) {
        ref('imageService')
    }
    userRoleService(UserRoleServiceImplService) {
        ref('userRoleService')
        roleService = ref('roleService')
        userService = ref('userService')
    }
    customMailService(MailServiceImplService) {
        ref('customMailService')
    }
    localeResolver(FixedLocaleResolver, new Locale('uk', 'UA'))

    //disables password encoder
    passwordEncoder(PlaintextPasswordEncoder)
}
