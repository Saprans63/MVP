//
//  CreateViewController.swift
//  MVP
//
//  Created by Apple user on 23/09/21.
//

import UIKit

class CreateViewController: BaseViewController, CreateView {
    var home = HomeViewController()
    
   
    
    func onLoadPosts(posts: [Post]) {
        if posts.count > 0 {
            
        }else{
            // error case
        }
    }
    
    func onPostDeleted(deleted: Bool) {
        if deleted {
            presenter.apiPostList()
        }else{
            // error case
        }
    }
    
    var items : Array<Post> = Array()
        var presenter: CreatePresenter!
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var bodyText: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    func initViews(){
        presenter = CreatePresenter()
        presenter.createView = self
        presenter.controller = self
        
        presenter.apiPostList()
    
    }
    
    @IBAction func AddButton(_ sender: Any) {
        let name5 = titleText.text
            let name6 = bodyText.text
        self.presenter.apiPostCreate(post: Post(title: name5!, body: name6!))
            
            let homeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
            self.navigationController?.pushViewController(homeView, animated: true)
            
            if name5 != nil && name6 != nil {
                titleText.text = nil
                bodyText.text = nil
            }
    }
    
}
