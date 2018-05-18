import grails.validation.ValidationException

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(redirect: "/news")
        "/students"(view: '/static/students/students')
        "/students/studcity"(view: '/static/students/studcity')
        "/students/faculty"(view: '/static/students/faculty')
        "/students/department"(view: '/static/students/department')
        "404"(view: '/notFound')
        "500"(controller: "error", action: "handleValidationException", exception: ValidationException)
        "500"(controller: "error", action: "index")
    }
}
