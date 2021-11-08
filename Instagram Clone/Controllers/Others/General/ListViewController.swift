//
//  ListViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var data:[UserRelationship]
    init(data:[UserRelationship]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.data = []
        super.init(coder: coder)
        //fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource  = self
        tableview.register(UINib(nibName: "UserFollowCell", bundle: nil), forCellReuseIdentifier: "UserFollowCell")

    }
}


extension ListViewController:UITableViewDelegate,UITableViewDataSource,UserFollowProtocol{


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "UserFollowCell", for: indexPath) as! UserFollowCell
        cell.configure(with: data[indexPath.row])
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        //let model = data[indexPath.row]
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }


    func didTapFollowUnfollowBtn(model: UserRelationship) {
        switch model.type {
            case .following:
                // perform firebase update to unfollow
                break
            case .not_following:
                // perform firebase update to follow
                break
        }
    }


}
