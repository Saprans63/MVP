

import Foundation
import Alamofire

protocol HomeView {
    func onLoadPosts(posts: [Post])
    
    func onPostDeleted(deleted: Bool)
}
