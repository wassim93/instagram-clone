//
//  ViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit
import Firebase

struct HomeFeedRenderViewModel {
    let header:PostRenderViewModel
    let primaryContent:PostRenderViewModel // post
    let actions:PostRenderViewModel // like , comment , share
    let comments:PostRenderViewModel
}

class HomeViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    private var feedRenderModels = [HomeFeedRenderViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "IgFeedPostCell", bundle: nil), forCellReuseIdentifier: "IgFeedPostCell")
        tableview.register(UINib(nibName: "IgFeedPostHeaderCell", bundle: nil), forCellReuseIdentifier: "IgFeedPostHeaderCell")
        tableview.register(UINib(nibName: "IgFeedPostActionsCell", bundle: nil), forCellReuseIdentifier: "IgFeedPostActionsCell")
        tableview.register(UINib(nibName: "IgFeedPostGeneralCell", bundle: nil), forCellReuseIdentifier: "IgFeedPostGeneralCell")
        createMockModels()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)

        checkAuthentication()

    }

    func createMockModels(){
        let user = User(bio: "",
                        username: "joe",
                        name: (first: "", last: ""),
                        profilePic: URL(string: "https://www.google.com")!,
                        birthDate: Date(),
                        gender: .male,
                        counts: UserCount(followers: 3, following: 50, posts: 2),
                        joinDate: Date())

        let post = UserPost(identifier: "",
                            postType: .photo,
                            thumbnailImage: URL(string: "https://www.google.com")!,
                            postURL: URL(string: "https://www.google.com")!,
                            caption: nil,
                            likeCount: [],
                            comments: [],
                            createdDate: Date(),
                            taggedUsers: [], owner: user)

        var comments = [PostComment]()
        for i in 0..<2 {
            comments.append(PostComment(identifier: "\(i)",
                                        username: "@wass",
                                        text: "lovely post dude",
                                        createdDate: Date(),
                                        likes: []))
        }
        for i in 0..<5{
            let viewModel = HomeFeedRenderViewModel(header: PostRenderViewModel(renderType: .header(provider: user)),
                                                    primaryContent: PostRenderViewModel(renderType: .primaryContent(provider: post)),
                                                    actions: PostRenderViewModel(renderType: .actions(provider: "")),
                                                    comments: PostRenderViewModel(renderType: .comments(comments: comments)))
            feedRenderModels.append(viewModel)
        }

        print(feedRenderModels.count)
    }



    fileprivate func checkAuthentication() {
        if Auth.auth().currentUser == nil {
            let loginVc = AppHelper.initVcFromStoryboard(storyboardName: "Onboarding", vcIdentifier: "LoginViewController")
            DispatchQueue.main.async {
                self.present(loginVc, animated: false)
            }
        }
    }
}


extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let x = section
        let model:HomeFeedRenderViewModel
        if x == 0 {
            model = feedRenderModels[0]
        }else{
            let position = x % 4 == 0 ? x/4 : ((x-(x % 4)) / 4)
            model = feedRenderModels[position]
        }
        let subSection = x % 4
        if subSection == 0 {
            //header
            return 1
        }else if subSection == 1 {

            //post
            return 1
        }else if subSection == 2 {
            //actions
            return 1
        }else if subSection == 3 {
            //comments
            let commentModel =  model.comments
            switch commentModel.renderType {
                case .comments(comments: let comments): return comments.count > 2 ? 2 : comments.count
                case .header, .actions , .primaryContent: return 0
            }

        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return feedRenderModels.count * 4

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let x = indexPath.section
        let model:HomeFeedRenderViewModel
        if x == 0 {
            model = feedRenderModels[0]
        }else{
            let position = x % 4 == 0 ? x/4 : ((x-(x % 4)) / 4)
            model = feedRenderModels[position]
        }

        let subSection = x % 4
        if subSection == 0 {
            //header
            let headerModel = model.header
            switch headerModel.renderType {
                case .header(let user):
                    let cell = tableview.dequeueReusableCell(withIdentifier: "IgFeedPostHeaderCell", for: indexPath) as! IgFeedPostHeaderCell
                    return cell
                case .comments, .actions , .primaryContent: return UITableViewCell()

            }
        }else if subSection == 1 {
            //post
            let postModel = model.primaryContent
            switch postModel.renderType {
                case .primaryContent(let post):
                    let cell = tableview.dequeueReusableCell(withIdentifier: "IgFeedPostCell", for: indexPath) as! IgFeedPostCell
                    return cell
                case .comments, .actions , .header: return UITableViewCell()
            }
        }else if subSection == 2 {
            //actions
            let actionModel = model.actions
            switch actionModel.renderType {
                case .actions(let provider):
                    let cell = tableview.dequeueReusableCell(withIdentifier: "IgFeedPostActionsCell", for: indexPath) as! IgFeedPostActionsCell
                    return cell
                case .comments, .primaryContent , .header: return UITableViewCell()
            }
        }else if subSection == 3 {
            //comments
            let commentModel =  model.comments
            switch commentModel.renderType {
                case .comments(comments: let comments):
                    let cell = tableview.dequeueReusableCell(withIdentifier: "IgFeedPostGeneralCell", for: indexPath) as! IgFeedPostGeneralCell
                    return cell
                case .header, .actions , .primaryContent: return UITableViewCell()
            }

        }
        return UITableViewCell()
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let subSection = indexPath.section % 4
        if subSection == 0 {
            //header
            return 60
        }else if subSection == 1 {
            //post
            return tableview.frame.width
        }else if subSection == 2 {
            //actions
            return 60
        }else if subSection == 3 {
            // comments
            return 50
        }
        return 0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let subSection = section % 4
        return subSection == 3 ? 50 : 0

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
    }


}

