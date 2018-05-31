import grails.validation.ValidationException

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(redirect: '/news/index?offset=0&max=10')
        "/students"(view: '/static/students/students')
        "/students/studcity"(view: '/static/students/studcity')
        "/students/faculty"(view: '/static/students/faculty')
        "/students/department"(view: '/static/students/department')
        "/students/program"(view: '/static/students/program')
        "/students/radioSection"(view: '/static/students/radioSection')
        "/students/contacts"(view: '/static/students/contacts')
        "/inviteUser"(view: '/email/inviteEmail')
        "/enrollee"(view: '/static/enrollee/enrollee')
        "/instructions"(view: '/static/instructions/instruction')
        "/instructions/news"(view: '/static/instructions/news')
        "/instructions/schedule"(view: '/static/instructions/schedule')
        "/instructions/faq"(view: '/static/instructions/faq')
        "/instructions/users"(view: '/static/instructions/users')
        "/instructions/my"(view: '/static/instructions/my')
        "404"(view: '/notFound')
        "500"(controller: "error", action: "handleValidationException", exception: ValidationException)
        "500"(controller: "error", action: "index")
    }
}
