//
//  NotificationViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private lazy var noNotificationView = NoNotificationView()

    private let spinner :UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
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

    private func addNoNotificationView(){
        tableView.isHidden = true
        view.addSubview(noNotificationView)
        noNotificationView.frame = CGRect(x: 0, y: 0, width: view.frame.width/2, height: view.frame.width/4)
        noNotificationView.center = view.center

    }
    

}

extension NotificationViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return UITableViewCell()
    }


}
