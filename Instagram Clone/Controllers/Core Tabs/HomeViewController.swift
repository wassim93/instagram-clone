//
//  ViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkAuthentication()
//        do{
//            try Auth.auth().signOut()
//        }catch{
//            print("cannot sign out")
//        }

    }



    fileprivate func checkAuthentication() {
        if Auth.auth().currentUser == nil {
            let storyboard = UIStoryboard.init(name: "Onboarding", bundle: nil)

            let loginVc = storyboard.instantiateViewController(identifier: "LoginViewController")
            loginVc.modalPresentationStyle = .fullScreen
            DispatchQueue.main.async {
                self.present(loginVc, animated: false)
            }
        }
    }







}

