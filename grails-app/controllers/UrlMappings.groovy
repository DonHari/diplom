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
        "/enrollee"(view: '/static/enrollee/enrollee')
        "404"(view: '/notFound')
        "500"(controller: "error", action: "handleValidationException", exception: ValidationException)
        "500"(controller: "error", action: "index")
    }
}
