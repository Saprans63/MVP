//
//  CreatePresenter.swift
//  MVP
//
//  Created by Apple user on 23/09/21.
//

import Foundation

protocol CreatePresenterProtocol {
    func apiPostList()
    func apiPostCreate(post:Post)
}

class CreatePresenter: CreatePresenterProtocol {
    var createView: CreateView!
    var controller: BaseViewController!
    
    func apiPostList() {
        controller?.showProgress()
        
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            self.controller?.hideProgress()
            switch response.result {
            case .success:
                let posts = try! JSONDecoder().decode([Post].self, from: response.data!)
                self.createView.onLoadPosts(posts: posts)
            case let .failure(error):
                print(error)
                self.createView.onLoadPosts(posts: [Post]())
            }
        })
    }
    
func apiPostCreate(post: Post) {
    controller?.showProgress()
      AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: {response in
        self.controller?.hideProgress()
          switch response.result {
          case .success:
              print(response.result)
    
          case let .failure(error):
              print(error)
          }
      })
  }
}
