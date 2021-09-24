
import Foundation

struct Post: Decodable {
    var id: String? = ""
    var title: String? = ""
    var body: String? = ""
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
    
    init(title: String, body: String, id: String) {
        self.title = title
        self.body = body
        self.id = id
    }
}
