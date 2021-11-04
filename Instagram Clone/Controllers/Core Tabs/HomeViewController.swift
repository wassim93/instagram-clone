//
//  ViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {



    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "IgFeedPostCell", bundle: nil), forCellReuseIdentifier: "IgFeedPostCell")

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)

        checkAuthentication()
//        do{
//            try Auth.auth().signOut()
//        }catch{
//            print("cannot sign out")
//        }

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
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "IgFeedPostCell", for: indexPath) as! IgFeedPostCell
        return cell
    }


}

