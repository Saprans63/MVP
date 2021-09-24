
import Foundation

protocol EditPresenterProtocol {
    func apiPostList()
    func apiPostUptade(post:Post)
}

class EditPresenter: EditPresenterProtocol {
    var editView: EditView!
    var controller: BaseViewController!
    
    func apiPostList() {
        controller?.showProgress()
        
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            self.controller?.hideProgress()
            switch response.result {
            case .success:
                let posts = try! JSONDecoder().decode([Post].self, from: response.data!)
                self.editView.onLoadPosts(posts: posts)
            case let .failure(error):
                print(error)
                self.editView.onLoadPosts(posts: [Post]())
            }
        })
    }
    
    func apiPostUptade(post: Post) {
        controller?.showProgress()
        AFHttp.put(url: AFHttp.API_POST_UPDATE + post.id!, params: AFHttp.paramsPostUpdate(post: post), handler: {response in
            self.controller?.hideProgress()
            switch response.result {
            case .success:
                print(response.result)
                self.editView.onLoadPosts(posts: [Post]())
            case let .failure(error):
                print(error)
            }
        })
    }
}
