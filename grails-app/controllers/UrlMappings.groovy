import grails.validation.ValidationException

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "404"(view:'/notFound')
        "500"(controller: "error", action: "handleValidationException", exception: ValidationException)
        "500"(controller: "error", action: "index")
    }
}
