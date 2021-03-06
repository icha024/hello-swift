import Foundation
if CommandLine.arguments.count != 2 {
    print("Usage: hello NAME")
    exit(1)
}

let name = CommandLine.arguments[1]
    sayHello(name: name)

import Kitura

// Create a new router
let router = Router()

// Handle HTTP GET requests to /
router.get("/") {
    request, response, next in
    response.send("Hello, \(name)!")
    next()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8080, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()