//
//  EditViewController.swift
//  MVP
//
//  Created by Apple user on 23/09/21.
//

import UIKit

class EditViewController: BaseViewController, EditView, CreateView {
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
        var presenter: EditPresenter!
    
    @IBOutlet weak var titleEdit: UITextField!
    
    @IBOutlet weak var bodyEdit: UITextField!
    
    @IBOutlet weak var IdEdit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    func initViews(){
        presenter = EditPresenter()
        presenter.editView = self
        presenter.controller = self
        
        presenter.apiPostList()
    
    }
    
    
    @IBAction func EditButton(_ sender: Any) {
               let nameTitle = titleEdit.text
               let nameBody = bodyEdit.text
               let nameId = IdEdit.text
              self.presenter.apiPostUptade(post: Post(title: nameTitle!, body: nameBody!, id: nameId!))
               
               let homeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
               self.navigationController?.pushViewController(homeView, animated: true)
               
               if nameTitle != nil && nameBody != nil {
                   titleEdit.text = nil
                   bodyEdit.text = nil
               }

    }
    

}
