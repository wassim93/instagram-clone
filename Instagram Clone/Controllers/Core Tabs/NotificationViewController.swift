//
//  NotificationViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit

class NotificationViewController: UIViewController {

    private lazy var noNotificationView = NoNotificationView()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = AppHelper.getLocalizeString(str: "notification_ui_title")
        view.addSubview(noNotificationView)

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        noNotificationView.frame = CGRect(x: 0, y: 0, width: view.frame.width/2, height: view.frame.width/4)
        noNotificationView.center = view.center
    }
    

}
