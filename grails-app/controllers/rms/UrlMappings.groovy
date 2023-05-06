package rms

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "405"(view:'/error')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
