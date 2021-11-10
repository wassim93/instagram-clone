//
//  NotificationViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit

struct UserNotification {
    let type:UserNotificationType
    let text:String
    let user:User
}
enum UserNotificationType {
    case follow(state:FollowState)
    case like(post:UserPost)
}

class NotificationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private lazy var noNotificationView = NoNotificationView()
    private var models = [UserNotification]()

    private let spinner :UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNotifications()
        navigationItem.title = AppHelper.getLocalizeString(str: "notification_ui_title")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        tableView.register(UINib(nibName: "NotificationFollowEventCell", bundle: nil), forCellReuseIdentifier: "NotificationFollowEventCell")
        tableView.register(UINib(nibName: "NotificationLikeEventCell", bundle: nil), forCellReuseIdentifier: "NotificationLikeEventCell")
        view.addSubview(spinner)
        //spinner.startAnimating()

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        spinner.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        spinner.center = view.center

    }

    private func fetchNotifications(){
        for x in 0...40 {
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

            let model = UserNotification(type: x % 2 == 0 ? .follow(state:.following) : .like(post: post),
                                         text: x % 2 == 0 ? "started following you": "Liked your post",
                                         user: user)


            models.append(model)
        }
    }

    private func addNoNotificationView(){
        tableView.isHidden = true
        view.addSubview(noNotificationView)
        noNotificationView.frame = CGRect(x: 0, y: 0, width: view.frame.width/2, height: view.frame.width/4)
        noNotificationView.center = view.center

    }
    

}

extension NotificationViewController:UITableViewDelegate,UITableViewDataSource,NotificationsProtocol{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        switch model.type {
            case .like(_):
                // like cell
                let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationLikeEventCell", for: indexPath) as! NotificationLikeEventCell
                cell.delegate = self
                cell.configure(with: model)
                return cell

            case .follow:
                // follow cell
                let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationFollowEventCell", for: indexPath) as! NotificationFollowEventCell
                cell.delegate = self
                cell.configure(with: model)
                return cell
        }
    }


    func didTapFollowUnfollowBtn(model: UserNotification) {
        print("tap follow")
        // perform database update
    }

    func didTapRelatedPostBtn(model: UserNotification) {
        print("tap post")

        switch model.type {
            case .like(let post):
                let postVc = AppHelper.initVcFromStoryboard(storyboardName: "General", vcIdentifier: "PostViewController") as! PostViewController
                postVc.title = post.postType.rawValue
                postVc.navigationItem.largeTitleDisplayMode = .never
                postVc.model = post
                //postVc.model = nil
                navigationController?.pushViewController(postVc, animated: true)
            case.follow(_):
                fatalError("Dev issue should never get called")
        }

    }
}
