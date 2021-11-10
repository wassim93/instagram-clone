//
//  PostViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit

/*
 Section
  - Header Post cell
 Section
 - PostCell for the post content
 Section
 - Post Actions cell for action buttons
 Section
 - Post General cell  for comments
 */

/// states of the rendered cells
enum PostRenderType {
    case header(provider: User)
    case primaryContent(provider: UserPost) // post
    case actions(provider:String) // like , comment , share
    case comments(comments:[PostComment])
}
/// model of rendered posts
struct PostRenderViewModel {
    let renderType:PostRenderType
}

class PostViewController: UIViewController {

    //FIXME: missing custom cell for this tableview

    @IBOutlet weak var tableview: UITableView!
    private var renderModels = [PostRenderViewModel]()
    var model:UserPost?
    init(model:UserPost?) {
        self.model =  model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.model = nil
        super.init(coder: coder)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "IgFeedPostCell", bundle: nil), forCellReuseIdentifier: "IgFeedPostCell")
        tableview.register(UINib(nibName: "IgFeedPostHeaderCell", bundle: nil), forCellReuseIdentifier: "IgFeedPostHeaderCell")
        tableview.register(UINib(nibName: "IgFeedPostActionsCell", bundle: nil), forCellReuseIdentifier: "IgFeedPostActionsCell")
        tableview.register(UINib(nibName: "IgFeedPostGeneralCell", bundle: nil), forCellReuseIdentifier: "IgFeedPostGeneralCell")
        configureModels()

    }


    private func configureModels(){
        // header
        guard let userPostModel = self.model else{
            return
        }
        renderModels.append(PostRenderViewModel(renderType: .header(provider: userPostModel.owner)))

        // post

        renderModels.append(PostRenderViewModel(renderType: .primaryContent(provider: userPostModel)))

        // actions

        renderModels.append(PostRenderViewModel(renderType: .actions(provider: "")))


        // 4 comments
        var comments = [PostComment]()
        for i in 0..<4 {
            comments.append(PostComment(identifier: "123_\(i)",
                                        username: "@wassim",
                                        text: "great one",
                                        createdDate: Date(),
                                        likes: []))
        }
        renderModels.append(PostRenderViewModel(renderType: .comments(comments: comments)))

    }

}


extension PostViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch renderModels[section].renderType {
            case .header(_):
                return 1
            case .primaryContent(_):
                return 1
            case .actions(_):
                return 1
            case .comments(let comments):
                return comments.count > 4 ? 4 : comments.count

        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return renderModels.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = renderModels[indexPath.section]
        switch model.renderType {
            case .header(_):
                let cell = tableview.dequeueReusableCell(withIdentifier: "IgFeedPostHeaderCell", for: indexPath) as! IgFeedPostHeaderCell
                return cell
            case .primaryContent(_):
                let cell = tableview.dequeueReusableCell(withIdentifier: "IgFeedPostCell", for: indexPath) as! IgFeedPostCell
                return cell
            case .actions(_):
                let cell = tableview.dequeueReusableCell(withIdentifier: "IgFeedPostActionsCell", for: indexPath) as! IgFeedPostActionsCell
                return cell
            case .comments(_):
                let cell = tableview.dequeueReusableCell(withIdentifier: "IgFeedPostGeneralCell", for: indexPath) as! IgFeedPostGeneralCell
                return cell

        }

    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = renderModels[indexPath.section]
        switch model.renderType {
            case .header(_):
                return 60
            case .primaryContent(_):
                return tableview.frame.width
            case .actions(_):
                return 60
            case .comments(_):
                return 50
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
    }


}
